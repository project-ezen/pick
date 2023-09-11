package com.edu.board.controller;
import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.board.dao.BoardDAO;
import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.JjimDTO;
import com.edu.board.dto.PageMaker;
import com.edu.board.dto.PagingCriteria;
import com.edu.board.dto.ReplyDTO;
import com.edu.board.service.BoardService;
import com.edu.board.service.ReplyService;
import com.edu.member.dto.MemberDTO;
import com.edu.member.service.MemberService;


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
	public void articleDetail(@RequestParam("board_id")int board_id, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		System.out.println("으아ㅓㄹㅇ너래ㅑ어랻저래ㅑㅇ너량널야ㅓ래ㅑㅓㅇ랴ㅓㄴㄴ어랴ㅐ얼" + member);
		
		
		BoardDTO boardDTO = boardService.articleDetail(board_id);
		System.out.println("BCI articleDetail() : " + boardDTO);
		model.addAttribute("article",boardDTO);
		
		List<JjimDTO> jjimDTO = boardService.jjimSelect(board_id);
		model.addAttribute("liked", jjimDTO);
		System.out.println("jjimDTO List 값 : " + jjimDTO);
		
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
	
	
	//-----------------------------------------------------------------------------------------------------------
	//다중 이미지 업로드하기
	//-----------------------------------------------------------------------------------------------------------
	private List<String> uploadMulti(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<String> 		fileList	= new ArrayList<String>();
		Iterator<String> 	fileNames 	= multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			System.out.println("##### 다중 이미지 업로드하기 originalFileName ==> " + originalFileName);
			fileList.add(originalFileName);
			File file = new File(ARTICLE_IMAGE_REPO +"\\"+"contentImage"+ "\\" + fileName);
			if(mFile.getSize() != 0) { //File Null Check
				if(!file.exists()) { //경로상에 파일이 존재하지 않을 경우
					file.getParentFile().mkdirs();  //경로에 해당하는 디렉토리들을 생성
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+"contentImage"+ "\\" + originalFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
				}
			}
		}
		return fileList;
	}


	// 찜 등록
	@Override
	@ResponseBody
	@RequestMapping(value="/board/jjimOK", method=RequestMethod.GET, produces = "application/json")
	public JjimDTO jjimOK(@RequestParam("board_id") int board_id, @RequestParam("m_id") String m_id) throws Exception {
		JjimDTO jjimDTO = new JjimDTO();
		jjimDTO.setBoard_id(board_id);
		jjimDTO.setM_id(m_id);
		logger.info("likedDTO 값: " + jjimDTO);
		boardService.jjimOK(jjimDTO);
		return jjimDTO;
	}


	// 찜 삭제
	@Override
	@ResponseBody
	@RequestMapping(value="/board/jjimNO", method=RequestMethod.GET, produces = "application/json")
	public JjimDTO jjimNO(@RequestParam("board_id") int board_id, @RequestParam("m_id") String m_id) throws Exception {
		JjimDTO jjimNO = new JjimDTO();
		jjimNO.setBoard_id(board_id);
		jjimNO.setM_id(m_id);
		boardService.jjimNO(jjimNO);
		return jjimNO;
	}
	
	
	

}
