package com.edu.board.service;


import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.PagingCriteria;

import oracle.jdbc.proxy.annotation.Post;

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
	
	// 전체 게시글 수 구하기 (Paging 처리)
	@Override
	public int boardListTotalCount(PagingCriteria pcri) throws Exception {
		return boardDAO.boardListTotalCount(pcri);
	}
	
	// 게시글 목록 가져오기 (Paging)
	@Override
	public List<BoardDTO> boardListPaging(PagingCriteria pcri) throws Exception {
		return boardDAO.boardListPaging(pcri);
	}
	
	// 게시글번호에 해당하는 상세정보
	@Override
	public BoardDTO articleDetail(int board_id) throws Exception {
		BoardDTO boardDTO = boardDAO.selectArticle(board_id);
		return boardDTO;
	}
	
	// 게시글 작성(post)
	@Override
	public void create(BoardDTO boardDTO) throws SQLException {
		boardDAO.create(boardDTO);
	}
	

}
