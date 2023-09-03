package com.edu.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.PagingCriteria;

import oracle.jdbc.proxy.annotation.Post;


public interface BoardService {
	
	// 게시글 목록
	//public List<BoardDTO> recipeBoard() throws Exception;
	
	// 전체 게시글 수 구하기 (Paging 처리)
	public int boardListTotalCount(PagingCriteria pcri) throws Exception;

	// 게시글 목록 가져오기 (Paging)
	public List<BoardDTO> boardListPaging(PagingCriteria pcri) throws Exception;
	
	// 게시글번호에 해당하는 상세정보
	public BoardDTO articleDetail(int board_id) throws Exception;
	
	// 게시글 작성 (post)
	public void create(BoardDTO boardDTO) throws SQLException;
	
	// 게시글 삭제
	public void delete(int board_id) throws Exception;
	
}
