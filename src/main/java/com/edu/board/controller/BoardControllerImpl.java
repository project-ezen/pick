package com.edu.board.controller;
import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
	public ModelAndView recipeBoardPaging(HttpServletRequest request, HttpServletResponse response, PagingCriteria pcri) throws Exception {
		
		logger.info("boardArticleList");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setPcri(pcri);											//pcri에 찜갯수,댓글갯수 포함됨
		pageMaker.setTotalCount(boardService.boardListTotalCount(pcri));	// pageMaker.totalCount에 총 게시글 수 넣기
		List<BoardDTO> list = boardService.boardListPaging(pcri);			// 게시글 목록(페이징 처리 포함) List로 넣기
		logger.info(" 게시글의 총 건수: " +pageMaker.getTotalCount());
		System.out.println("pageMaker =" + pageMaker);

		mav.addObject("articlesList", list);
		mav.addObject("pcri",pcri);
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
		
		/*
		System.out.println("셀렉트 옵션 값 : " + selop);
		pcri.setSelop(selop);
		System.out.println("셀렉트 옵션 setSelop값 : " + pcri.getSelop());
		
		if(pcri.getSelop() == "two") {
			System.out.println("셀렉트 옵션 값 : " + selop);
			List<BoardDTO> list2 = boardService.boardListJjim(pcri);
			mav.addObject("articlesList", list2);
			mav.addObject("pcri",pcri);
			mav.addObject("pageMaker", pageMaker);
		}
		*/
	}
	

	// 게시글 번호에 해당하는 상세정보
	@Override
	@RequestMapping(value="/board/recipedetail", method= {RequestMethod.GET, RequestMethod.POST})
	public void articleDetail(@RequestParam("board_id")int board_id, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		System.out.println("memberSession 값 : " + member);
		
		
		BoardDTO boardDTO = boardService.articleDetail(board_id);
		System.out.println("BCI articleDetail() : " + boardDTO);
		model.addAttribute("article",boardDTO);
		
		JjimDTO jjimDTO = new JjimDTO();
		
		if(member != null) {							// 로그인했을 경우
			String m_id = member.getM_id();				// 로그인한 회원의 m_id를 가져와서
			jjimDTO.setM_id(m_id);						// jjimDTO.m_id에 넣는다
			jjimDTO.setBoard_id(board_id);				// 해당 게시물 id를 가져와서 jjimDTO.board_id에 넣는다
			jjimDTO = boardService.jjimSelect(jjimDTO);	// 찜 조회값을 jjimDTO에 넣어 불러온다
			model.addAttribute("liked", jjimDTO);		// 불러온 jjimDTO에 liked 라는 변수이름을 준다
		}
		
		System.out.println("jjimDTO List 값 : " + jjimDTO);
		
		List<ReplyDTO> reply = replyService.list(board_id);		//게시판_id가 같은 댓글-> list로 넣어서 출력한다.
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
		// 썸네일
		String fileRealName = thupload(multiRequest);
		System.out.println("String fileRealName : " + fileRealName);
		// 서버에 저장할 파일이름 fileextension으로 .jpg 이런 식의 확장자 명을 구한다
		articleMap.put("thumbnail", fileRealName);
		// 본문 이미지
		String safeFile = uploadMulti(multiRequest);
		System.out.println("String safeFile : " + safeFile);
		articleMap.put("image", safeFile);
		
		
		String	message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html;charset=UTF-8");
		
		try {
			boardService.create(articleMap);
			System.out.println("ggggggggg ArticleMap: " + articleMap);
			if(fileRealName != null && fileRealName.length() != 0) {
				File srcDir = new File(ARTICLE_IMAGE_REPO + "\\" +"thumb"+ "\\" + "t_" + fileRealName);
				srcDir.createNewFile();
			}
			if(safeFile != null && safeFile.length() != 0) {
				File srcDir = new File(ARTICLE_IMAGE_REPO + "\\" +"contentImage"+ "\\" + safeFile);
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
			
			if(safeFile != null && safeFile.length() != 0) {
				File srcDir = new File(ARTICLE_IMAGE_REPO + "\\" +"contentImage"+ "\\" + safeFile);
				srcDir.delete();
			}
			
			
			message	 = "<script>";
			message	+= "alert('오류가 발생하였습니다.\n다시 시도해 주십시오.');";
			message	+= "location.href='" + multiRequest.getContextPath() + "/board/write';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}

//=========================================================================================================================================

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
			break;
		}
		System.out.println("return fileRealName 썸네일 : " + fileRealName);
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
	@Override
	@RequestMapping(value="/board/updateW", method=RequestMethod.POST)
	public ResponseEntity updateW(@RequestParam("board_id")int board_id, HttpServletResponse response, MultipartHttpServletRequest multiRequest)
			throws Exception {
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
		
		// 썸네일
		String fileRealName = thupload(multiRequest); 
		System.out.println("String fileRealName : " + fileRealName);
		// 서버에 저장할 파일이름 fileextension으로 .jpg 이런 식의 확장자 명을 구한다
		articleMap.put("thumbnail", fileRealName);
		// 본문 이미지
		String safeFile = uploadMulti(multiRequest);
		System.out.println("String safeFile : " + safeFile);
		articleMap.put("image", safeFile);
		
		
		String	message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html;charset=UTF-8");
		
		try {
			boardService.updateW(articleMap);
			System.out.println("ggggggggg ArticleMap: " + articleMap);
			if(fileRealName != null && fileRealName.length() != 0) {
				File srcDir = new File(ARTICLE_IMAGE_REPO + "\\" +"thumb"+ "\\" + "t_" + fileRealName);
				srcDir.createNewFile();
			}
			if(safeFile != null && safeFile.length() != 0) {
				File srcDir = new File(ARTICLE_IMAGE_REPO + "\\" +"contentImage"+ "\\" + safeFile);
				srcDir.createNewFile();
			}
			
			message	 = "<script>";
			message	+= "alert('게시글을 수정하였습니다.');";
			message	+= "location.href='" + multiRequest.getContextPath() + "/board/articleList';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "thumb" + "\\" + "t_" + fileRealName);
			srcFile.delete();
			
			if(safeFile != null && safeFile.length() != 0) {
				File srcDir = new File(ARTICLE_IMAGE_REPO + "\\" +"contentImage"+ "\\" + safeFile);
				srcDir.delete();
			}
			
			
			message	 = "<script>";
			message	+= "alert('오류가 발생하였습니다.\n다시 시도해 주십시오.');";
			message	+= "location.href='" + multiRequest.getContextPath() + "/board/write';";
			message	+= "</script>";
			resEnt	 = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	
	//-----------------------------------------------------------------------------------------------------------
	//다중 이미지 업로드하기
	//-----------------------------------------------------------------------------------------------------------
	private String uploadMulti(MultipartHttpServletRequest multReq) throws Exception {
		
		String fileRealName = null; // 파일 이름을 넣을 변수
		Iterator<String> fileNames = multReq.getFileNames(); // file이란 파라미터의 이름을 저장한 Enumeration 객체를 반환한다
		
		while(fileNames.hasNext()) { // 가져올 값 유무에 따라 true/false로 반환
			String fileName = fileNames.next(); // 다음 요소 값 반환(아무 타입이나)
			MultipartFile mFile = multReq.getFile(fileName); // 업로드된 파일에 대한 파일 객체 반환
			fileRealName = mFile.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드
			
			System.out.println("------------------------------------------------------------");
			System.out.println("fileName2 ==> " + fileName);
			System.out.println("imageFileName2 ==> " + fileRealName);
			
			File file = new File(ARTICLE_IMAGE_REPO + "\\" + "contentImage" + "\\" + fileRealName);
			if(mFile.getSize() != 0) {
				if(!file.exists()) {	// 파일을 올릴 경로에 파일이 존재하지 않으면
					file.getParentFile().mkdirs();	// 경로에 해당하는 디렉토리 생성
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "contentImage" + "\\" + fileRealName)); // 파일 변환
				}
			}
		}
		System.out.println("return fileRealName 본문이미지 : " + fileRealName);
		return fileRealName;
	}

//=========================================================================================================================================
	
	// 찜 등록
	@Override
	@ResponseBody
	@RequestMapping(value="/board/jjimOK", method= RequestMethod.GET, produces = "application/json")
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

//=========================================================================================================================================
	
	
	
	
	

}
