package com.edu.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.PagingCriteria;

public interface BoardDAO {
	
	// 게시글 목록
	public List selectAllArticlesList() throws DataAccessException;

	// 전체 게시글 수 구하기 (Paging 처리)
	public int boardListTotalCount(PagingCriteria pcri) throws DataAccessException;

	// 게시글 목록 가져오기 (Paging)
	public List<BoardDTO> boardListPaging(PagingCriteria pcri) throws DataAccessException;
}

