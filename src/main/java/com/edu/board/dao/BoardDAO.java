package com.edu.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.JjimDTO;
import com.edu.board.dto.PagingCriteria;



public interface BoardDAO {
	
	// 게시글 목록
	//public List selectAllArticlesList() throws DataAccessException;

	// 전체 게시글 수 구하기 (Paging 처리)
	public int boardListTotalCount(PagingCriteria pcri) throws DataAccessException;

	// 게시글 목록 가져오기 (Paging)
	public List<BoardDTO> boardListPaging(PagingCriteria pcri) throws DataAccessException;
	
	// 게시글 찜많은 순 가져오기 (Paging)
	public List<BoardDTO> boardListJjim(PagingCriteria pcri) throws DataAccessException;
	
	// 게시글 번호에 해당하는 상세정보
	public BoardDTO selectArticle(int board_id) throws DataAccessException;
	
	// 게시글 작성 (post)
	public int create(Map articleMap) throws DataAccessException;
	
	// 게시글 삭제
	public void delete(int board_id) throws DataAccessException;
	
	// 게시글 수정
	public void updateW(Map articleMap) throws DataAccessException;
	
	// 찜 등록
	public void jjimOK(JjimDTO jjimDTO) throws DataAccessException;
	
	// 찜 조회
	public JjimDTO jjimSelect(JjimDTO jjimDTO) throws DataAccessException;
	
	// 찜 삭제
	public void jjimNO(JjimDTO jjimNO) throws DataAccessException;

	//검색
	public List<BoardDTO> searchKeyword(PagingCriteria pcri) throws DataAccessException;

	
	
	// 다중 이미지
}

