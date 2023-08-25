package com.edu.board.service;

import java.util.List;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.PagingCriteria;

public interface BoardService {
	
	// 게시글 목록
	public List<BoardDTO> recipeBoard() throws Exception;
	
}

