package com.edu.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.board.dto.boardDTO;
import com.edu.board.dto.pagingCriteria;

@Repository("boardDAO")
public class boardDAOImpl implements boardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace="com.edu.board.mappers.boardMapper";
	
	@Override
	public List<boardDTO> boardListPaging(pagingCriteria cri) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".boardListPaging", cri);
	}

}
