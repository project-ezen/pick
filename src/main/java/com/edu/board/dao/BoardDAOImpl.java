package com.edu.board.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.edu.board.controller.BoardControllerImpl;
import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.JjimDTO;
import com.edu.board.dto.PagingCriteria;

import oracle.jdbc.proxy.annotation.Post;



@Repository("BoardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace="com.edu.board.mappers.boardMapper";
	@Autowired
	private BoardDTO boardDTO;
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	/* 게시글 목록
	@Override
	public List selectAllArticlesList() throws DataAccessException {
		List<BoardDTO> articlesList = sqlSession.selectList(namespace + ".selectAllArticleList");
		return articlesList;
	}
	*/
	// 전체 게시글 수 구하기 (Paging 처리)
	@Override
	public int boardListTotalCount(PagingCriteria pcri) throws DataAccessException {
		return sqlSession.selectOne(namespace + ".boardListTotalCount", pcri);
	}
	
	// 게시글 목록 가져오기 (Paging)
	@Override
	public List<BoardDTO> boardListPaging(PagingCriteria pcri) throws DataAccessException {
		return sqlSession.selectList(namespace + ".boardListPaging", pcri);
	}
	
	// 게시글 번호에 해당하는 상세정보
	@Override
	public BoardDTO selectArticle(int board_id) throws DataAccessException {
		return sqlSession.selectOne(namespace + ".selectArticle", board_id);
	}
	
	// 게시글 작성 (post)
	@Override
	public int create(Map articleMap) throws DataAccessException {
		int board_id = selectNewArticleNO();
		System.out.println("새로운 게시글 번호 추출: " + board_id);
		articleMap.put("board_id", board_id);
		sqlSession.insert(namespace + ".create", articleMap);
		return board_id;
	}
	
	// 새로운 게시글 번호 추출
	private int selectNewArticleNO() throws DataAccessException {
		return sqlSession.selectOne(namespace + ".selectNewArticleNO");
	}
	
	// 게시글 삭제
	@Override
	public void delete(int board_id) throws DataAccessException {
		sqlSession.delete(namespace + ".delete", board_id);
	}
	
	// 찜 등록
	@Override
	public void jjimOK(JjimDTO jjimDTO) throws DataAccessException {
		jjimDTO.setJjim_id(selectjjimNO());
		logger.info("jjimOK DAO : " + jjimDTO);
		sqlSession.insert(namespace + ".jjimOK", jjimDTO);
	}
	
	// 찜 id 추출
	private int selectjjimNO() throws DataAccessException {
		return sqlSession.selectOne(namespace + ".selectjjimNO");
	}
	
	// 찜 조회
	public JjimDTO jjimSelect(JjimDTO jjimDTO) throws DataAccessException {
		return sqlSession.selectOne(namespace + ".jjimSelect", jjimDTO);
	}
	
	// 찜 삭제
	@Override
	public void jjimNO(JjimDTO jjimNO) throws DataAccessException {
		sqlSession.delete(namespace + ".jjimNO", jjimNO);
	}

	@Override
	public List<BoardDTO> searchKeyword(PagingCriteria pcri) throws DataAccessException {
		return sqlSession.selectList(namespace + ".searchKeyword",pcri);
	}

	
	
}
		
