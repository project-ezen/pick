package com.edu.board.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.PagingCriteria;

@Repository("BoardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace="com.edu.board.mappers.boardMapper";
	
	// 게시글 목록
	@Override
	public List selectAllArticlesList() throws DataAccessException {
		List<BoardDTO> articlesList = sqlSession.selectList(namespace + ".selectAllArticleList");
		return articlesList;
	}
	
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
	
}	
