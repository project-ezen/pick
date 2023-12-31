package com.edu.board.service;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.JjimDTO;
import com.edu.board.dto.PagingCriteria;

import oracle.jdbc.proxy.annotation.Post;

import com.edu.board.controller.BoardControllerImpl;
import com.edu.board.dao.BoardDAO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	/* 게시글 목록
	@Override
	public List<BoardDTO> recipeBoard() throws Exception {
		List<BoardDTO> articlesList = boardDAO.selectAllArticlesList();
		return articlesList;
	}
	*/
	
	// 전체 게시글 수 구하기 (Paging 처리)
	@Override
	public int boardListTotalCount(PagingCriteria pcri) throws Exception {
		return boardDAO.boardListTotalCount(pcri);
	}
	
	// 게시글 목록 가져오기 (Paging)
	@Override
	public List<BoardDTO> boardListPaging(PagingCriteria pcri) throws Exception {
		logger.info("서비스");
		return boardDAO.boardListPaging(pcri);
	}
	
	// 게시글 찜 많은 순 가져오기(Paging)
	@Override
	public List<BoardDTO> boardListJjim(PagingCriteria pcri) throws Exception {
		return boardDAO.boardListJjim(pcri);
	}
	
	// 게시글번호에 해당하는 상세정보
	@Override
	public BoardDTO articleDetail(int board_id) throws Exception {
		BoardDTO boardDTO = boardDAO.selectArticle(board_id);
		return boardDTO;
	}
	
	// 게시글 작성(post)
	@Override
	public int create(Map articleMap) throws SQLException {
		return boardDAO.create(articleMap);
	}
	
	// 게시글 삭제
	@Override
	public void delete(int board_id) throws Exception {
		boardDAO.delete(board_id);
	}
	// 게시글 수정
	@Override
	public void updateW(Map articleMap) throws Exception {
		boardDAO.updateW(articleMap);
	}
	
	// 찜 등록
	@Override
	public void jjimOK(JjimDTO jjimDTO) throws Exception {
		boardDAO.jjimOK(jjimDTO);
	}
	
	// 찜 조회
	@Override
	public JjimDTO jjimSelect(JjimDTO jjimDTO) throws Exception {
		 return boardDAO.jjimSelect(jjimDTO);
	}
	
	// 찜 삭제
	@Override
	public void jjimNO(JjimDTO jjimNO) throws Exception {
		boardDAO.jjimNO(jjimNO);
	}



}
