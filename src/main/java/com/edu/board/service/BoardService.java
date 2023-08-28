package com.edu.board.service;

import java.util.List;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.PagingCriteria;

public interface BoardService {
	
	// 게시글 목록
	public List<BoardDTO> recipeBoard() throws Exception;
	
	
	// 전체 게시글 수 구하기 (Paging 처리)
	public int boardListTotalCount(PagingCriteria pcri) throws Exception;


	// 게시글 목록 가져오기 (Paging)
	public List<BoardDTO> boardListPaging(PagingCriteria pcri) throws Exception;
		
}
