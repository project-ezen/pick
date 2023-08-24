package com.edu.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/board")
public class boardController {
	
	private static final Logger logger = LoggerFactory.getLogger(boardController.class);
	
	@RequestMapping("/write")
	public ModelAndView boardWirtePage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("글쓰기 게시판 출력");
		String viewName = "./board/write";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
		
	}
	@RequestMapping("/articleList")
	public ModelAndView recipeBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("레시피목록 게시판 출력");
		String viewName = "./board/articleList";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
		
	}
	@RequestMapping("/recipedetail")
	public ModelAndView recipeDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("레시피상세 게시판 출력");
		String viewName = "./board/recipedetail";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
		
	}
	
	
	
}
