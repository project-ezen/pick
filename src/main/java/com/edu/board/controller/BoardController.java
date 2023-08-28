package com.edu.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;


public interface BoardController {
	
	// 게시글 목록
	public ModelAndView recipeBoard(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 게시글 작성 페이지
	public ModelAndView articleForm() throws Exception;
}

