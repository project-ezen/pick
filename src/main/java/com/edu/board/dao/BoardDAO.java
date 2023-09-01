package com.edu.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.PagingCriteria;

import oracle.jdbc.proxy.annotation.Post;

public interface BoardDAO {
	
	// 게시글 목록
	public List selectAllArticlesList() throws DataAccessException;

	// 전체 게시글 수 구하기 (Paging 처리)
	public int boardListTotalCount(PagingCriteria pcri) throws DataAccessException;

	// 게시글 목록 가져오기 (Paging)
	public List<BoardDTO> boardListPaging(PagingCriteria pcri) throws DataAccessException;
	
	// 게시글 번호에 해당하는 상세정보
	public BoardDTO selectArticle(int board_id) throws DataAccessException;
	
	// 게시글 작성 (post)
	public void create(BoardDTO boardDTO) throws DataAccessException;
}

