package com.edu.board.controller;




import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.edu.board.dto.PagingCriteria;


@Controller("BoardController")
public interface BoardController {

		// 게시글 목록
		//public ModelAndView recipeBoard(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
		
		// 게시글 작성 화면
		public ModelAndView articleForm() throws Exception;

		// 게시글 목록(페이징)화면 보여주기
		public ModelAndView recipeBoardPaging(HttpServletRequest request, HttpServletResponse response, PagingCriteria pcri) throws Exception;

		// 게시글 번호에 해당하는 상세내역
		public void articleDetail(@RequestParam("board_id") int board_id, Model model) throws Exception;
		
		// 게시글 작성(post)
		public ResponseEntity addNewArticle(HttpServletResponse response, MultipartHttpServletRequest multiRequest) throws Exception;
		
		// 게시글 삭제
		public ResponseEntity articleDelete(@RequestParam("articleNO") int articleNO,HttpServletRequest request, HttpServletResponse response) throws Exception;
		
		// 게시글 수정
		
		
		// 멀티이미지 업로드
		public void multiImageUploader(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
}

