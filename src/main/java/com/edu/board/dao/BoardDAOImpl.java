package com.edu.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.board.dto.BoardDTO;

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
	
	
}
