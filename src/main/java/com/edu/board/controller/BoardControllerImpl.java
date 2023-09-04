package com.edu.board.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping(value="/board/recipedetail", method=RequestMethod.GET)
	public void articleDetail(@RequestParam("board_id")int board_id, Model model) throws Exception {
		
		BoardDTO boardDTO = boardService.articleDetail(board_id);
		System.out.println("BCI articleDetail() : " + boardDTO);
		
		model.addAttribute("article",boardDTO);
		
	}


	// 게시글 작성(post)
	@Override
	@RequestMapping(value="/board/addNewArticle", method=RequestMethod.POST)
	public String addNewArticle(BoardDTO boardDTO, Model model) throws Exception {
		model.addAttribute("board", boardDTO);
		boardService.create(boardDTO);
		return "redirect:articleList";
	}

	
	// 게시글 삭제
	@Override
	@RequestMapping(value="/board/delete.do", method=RequestMethod.POST)
	public String articleDelete(int board_id) throws Exception {
		boardService.delete(board_id);
		return "redirect:articleList";
	}

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
				String filePath = "/resources/image";
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
				sFileInfo += "&sFileURL="+"/resources/image "+sRealFileNm;
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
