package com.edu.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dao.BoardDAO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	// 게시글 목록
	@Override
	public List<BoardDTO> recipeBoard() throws Exception {
		List<BoardDTO> articlesList = boardDAO.selectAllArticlesList();
		return articlesList;
	}

}
