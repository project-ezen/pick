package com.edu.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.PageMaker;
import com.edu.board.dto.PagingCriteria;
import com.edu.board.service.BoardService;
import com.edu.member.dto.MemberDTO;

@Controller("BoardController")
public class BoardControllerImpl implements BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardControllerImpl.class);
	
	@Autowired
	private BoardService boardService;
	@Autowired(required=false)
	private BoardDTO boardDTO;
	@Autowired(required=false)
	private MemberDTO memberDTO;

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
	public ModelAndView articleDetail(int board_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		boardDTO = boardService.articleDetail(board_id);
		
		System.out.println("BCI articleDetail() : " + boardDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("article", boardDTO);
		
		return mav;
	}

	

}
