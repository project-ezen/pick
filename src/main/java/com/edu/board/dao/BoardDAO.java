package com.edu.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.PagingCriteria;

public interface BoardDAO {
	
	// 게시글 목록
	public List selectAllArticlesList() throws DataAccessException;
}

