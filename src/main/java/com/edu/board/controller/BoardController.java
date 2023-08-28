package com.edu.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.board.dto.PagingCriteria;


public interface BoardController {

	// 게시글 목록
	//public ModelAndView recipeBoard(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 게시글 작성 페이지
	public ModelAndView articleForm() throws Exception;

	// 게시글 목록(페이징)화면 보여주기
	public ModelAndView recipeBoardPaging(HttpServletRequest request, HttpServletResponse response,
			PagingCriteria pcri) throws Exception;

	// 게시글 쓰기 처리
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
}

