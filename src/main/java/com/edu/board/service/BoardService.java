package com.edu.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.MultipartFile;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.JjimDTO;
import com.edu.board.dto.PagingCriteria;

import oracle.jdbc.proxy.annotation.Post;


public interface BoardService {
	
	// 게시글 목록
	//public List<BoardDTO> recipeBoard() throws Exception;
	
	// 전체 게시글 수 구하기 (Paging 처리)
	public int boardListTotalCount(PagingCriteria pcri) throws Exception;

	// 게시글 목록 가져오기 (Paging)
	public List<BoardDTO> boardListPaging(PagingCriteria pcri) throws Exception;
	
	// 게시글 찜 많은 순 가져오기(Paging)
	public List<BoardDTO> boardListJjim(PagingCriteria pcri) throws Exception;
	
	// 게시글번호에 해당하는 상세정보
	public BoardDTO articleDetail(int board_id) throws Exception;
	
	// 게시글 작성 (post)
	public int create(Map articleMap) throws SQLException;
	
	// 게시글 삭제
	public void delete(int board_id) throws Exception;
	
	// 게시글 수정
	public void updateW(Map articleMap) throws Exception;
	
	// 찜 등록
	public void jjimOK(JjimDTO likedDTO) throws Exception;
	
	// 찜 조회
	public JjimDTO jjimSelect(JjimDTO jjimDTO) throws Exception;
	
	// 찜 삭제
	public void jjimNO(JjimDTO jjimNO) throws Exception;

	
} 
