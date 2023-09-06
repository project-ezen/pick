package com.edu.board.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.board.dao.BoardDAO;
import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.PageMaker;
import com.edu.board.dto.PagingCriteria;
import com.edu.board.dto.ReplyDTO;
import com.edu.board.service.BoardService;
import com.edu.board.service.ReplyService;


@Controller("BoardController")
public class BoardControllerImpl implements BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardControllerImpl.class);
	
	@Autowired
	private BoardService boardService;
	@Autowired(required=false)
	private BoardDTO boardDTO;
	@Autowired
	private BoardDAO boardDAO;
	


	private static final String ARTICLE_IMAGE_REPO = "C:\\data\\team\\pick\\src\\main\\webapp\\resources\\images";

	//댓글
	@Inject
	@Autowired
	private ReplyService replyService;
	
	// 게시글 목록
	/*
	@Override
	@RequestMapping(value="/board/articleList", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView recipeBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.info("게시글 목록 화면좀 나와라");
		
		String viewName = "./board/articleList";
		ModelAndView mav = new ModelAndView();
		
		
		List<BoardDTO> articlesList = boardService.recipeBoard();
		mav.setViewName(viewName);
		mav.addObject("articleList", articlesList);
	
		return mav;
	}
	*/

	
	// 게시글 작성 화면
	@Override
	@RequestMapping(value="/board/write", method=RequestMethod.GET)
	public ModelAndView articleForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/write");
		return mav;
	}
	
	
	// 게시글 목록(페이징) 화면 보여주기
	@Override
	@RequestMapping(value="/board/articleList", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView recipeBoardPaging(HttpServletRequest request, HttpServletResponse response, PagingCriteria pcri)
			throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(pcri);
		pageMaker.setTotalCount(boardService.boardListTotalCount(pcri));

		List<BoardDTO> list = boardService.boardListPaging(pcri);
		mav.addObject("articlesList", list);
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}
	

	// 게시글 번호에 해당하는 상세정보
	@Override
	@RequestMapping(value="/board/recipedetail", method= {RequestMethod.GET, RequestMethod.POST})
	public void articleDetail(@RequestParam("board_id")int board_id, Model model ) throws Exception {
		
		BoardDTO boardDTO = boardService.articleDetail(board_id);
		System.out.println("BCI articleDetail() : " + boardDTO);
		model.addAttribute("article",boardDTO);
		
		
		System.out.println(board_id);
		List<ReplyDTO> reply = replyService.list(board_id);
		System.out.println(reply);
		model.addAttribute("reply", reply);
		
	}


	// 게시글 작성(post)
	@Override
	@RequestMapping(value="/board/addNewArticle", method=RequestMethod.POST)
	public ResponseEntity addNewArticle(HttpServletResponse response, MultipartHttpServletRequest multiRequest) throws Exception {
		multiRequest.setCharacterEncoding("UTF-8");
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multiRequest.getParameterNames();
		
		while(enu.hasMoreElements()) { // 현재 위치에 데이터가 있으면 true 반환
			String	name	= (String)enu.nextElement();
			String	value	= multiRequest.getParameter(name);
			System.out.println("name : "  + name);
			System.out.println("value : " + value);
			articleMap.put(name, value);
		}
		String fileRealName = thupload(multiRequest);
		// 서버에 저장할 파일이름 fileextension으로 .jpg 이런 식의 확장자 명을 구한다
		articleMap.put("thumbnail", fileRealName);
		
		String	message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html;charset=UTF-8");
		
		try {
			int board_id = boardService.create(articleMap);
			if(fileRealName != null && fileRealName.length() != 0) {
				File srcDir = new File(ARTICLE_IMAGE_REPO + "\\" +"thumb"+ "\\" + "t_" + fileRealName);
				srcDir.createNewFile();
			}
			message	 = "<script>";
			message	+= "alert('새로운 글을 추가하였습니다.');";
			message	+= "location.href='" + multiRequest.getContextPath() + "/board/articleList';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "thumb" + "\\" + "t_" + fileRealName);
			srcFile.delete();
			
			message	 = "<script>";
			message	+= "alert('오류가 발생하였습니다.\n다시 시도해 주십시오.');";
			message	+= "location.href='" + multiRequest.getContextPath() + "/board/write';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}

	// 썸네일 업로드
	private String thupload(MultipartHttpServletRequest multReq) throws Exception {
		
		String fileRealName = null; // 파일 이름을 넣을 변수
		Iterator<String> fileNames = multReq.getFileNames(); // file이란 파라미터의 이름을 저장한 Enumeration 객체를 반환한다
		
		while(fileNames.hasNext()) { // 가져올 값 유무에 따라 true/false로 반환
			String fileName = fileNames.next(); // 다음 요소 값 반환(아무 타입이나)
			MultipartFile mFile = multReq.getFile(fileName); // 업로드된 파일에 대한 파일 객체 반환
			fileRealName = mFile.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드
			
			System.out.println("------------------------------------------------------------");
			System.out.println("fileName ==> " + fileName);
			System.out.println("imageFileName ==> " + fileRealName);
			
			File file = new File(ARTICLE_IMAGE_REPO + "\\" + "thumb" + "\\" + "t_" + fileRealName);
			if(mFile.getSize() != 0) {
				if(!file.exists()) {	// 파일을 올릴 경로에 파일이 존재하지 않으면
					file.getParentFile().mkdirs();	// 경로에 해당하는 디렉토리 생성
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "thumb" + "\\" + "t_" + fileRealName)); // 파일 변환
				}
			}
		}
		return fileRealName;
	}
	
	
	// 게시글 삭제
	@Override
	@RequestMapping(value="/board/delete.do", method=RequestMethod.POST)
	public ResponseEntity articleDelete(@RequestParam("board_id") int board_id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		String message;
		ResponseEntity	resEnt			= null;
		HttpHeaders		responseHeaders	= new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		try {
			boardService.delete(board_id);
			
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='"+request.getContextPath()+"/board/articleList';";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	       
		} catch(Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/board/write';";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	// 게시글 수정
	
	
	// 멀티이미지 업로드
	@Override
	@RequestMapping(value="/multiImageUploader")
	public void multiImageUploader(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			//파일정보
			String sFileInfo = "";
			//파일명을 받는다 - 일반 원본파일명
			String sFilename = request.getHeader("file-name");
			//파일 확장자
			String sFilenameExt = sFilename.substring(sFilename.lastIndexOf(".")+1);
			//확장자를소문자로 변경
			sFilenameExt = sFilenameExt.toLowerCase();
				
			//이미지 검증 배열변수
			String[] allowFileArr = {"jpg","png","bmp","gif"};

			//확장자 체크
			int nCnt = 0;
			for(int i=0; i<allowFileArr.length; i++) {
				if(sFilenameExt.equals(allowFileArr[i])){
					nCnt++;
				}
			}

			//이미지가 아니라면
			if(nCnt == 0) {
				PrintWriter print = response.getWriter();
				print.print("NOTALLOW_"+sFilename);
				print.flush();
				print.close();
			} else {
				//디렉토리 설정 및 업로드	
				
				//파일경로
				String filePath = "C:\\data\\team\\pick\\src\\main\\webapp\\resources\\images\\contentImage\\";
				File file = new File(filePath);
				
				if(!file.exists()) {
					file.mkdirs();
				}
				
				String sRealFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new java.util.Date());
				sRealFileNm = today+UUID.randomUUID().toString() + sFilename.substring(sFilename.lastIndexOf("."));
				String rlFileNm = filePath + sRealFileNm;
				
				///////////////// 서버에 파일쓰기 ///////////////// 
				InputStream inputStream = request.getInputStream();
				OutputStream outputStream=new FileOutputStream(rlFileNm);
				int numRead;
				byte bytes[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				while((numRead = inputStream.read(bytes,0,bytes.length)) != -1){
					outputStream.write(bytes,0,numRead);
				}
				if(inputStream != null) {
					inputStream.close();
				}
				outputStream.flush();
				outputStream.close();
				
				///////////////// 이미지 /////////////////
				// 정보 출력
				sFileInfo += "&bNewLine=true";
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName="+ sFilename;
				sFileInfo += "&sFileURL="+"C:\\data\\team\\pick\\src\\main\\webapp\\resources\\images\\contentImage\\"+sRealFileNm;
				PrintWriter printWriter = response.getWriter();
				printWriter.print(sFileInfo);
				printWriter.flush();
				printWriter.close();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
}
