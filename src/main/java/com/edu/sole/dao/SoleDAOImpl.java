package com.edu.sole.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.edu.sole.dto.SoleSearchCriteria;
import com.edu.sole.dto.LiveSoleDTO;

@Repository
public class SoleDAOImpl implements SoleDAO {

	private static final Logger logger = LoggerFactory.getLogger(SoleDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.edu.sole.mappers.soleMapper";
	
	@Override
	public List<LiveSoleDTO> soleMain(SoleSearchCriteria solesearchcriteria) {
		// TODO Auto-generated method stub
		
		logger.info("DAO입장");
		return sqlSession.selectList(namespace + ".soleMain", solesearchcriteria);
		// return sqlSession.selectList(namespace + ".soleMain", livesoleDTO);
	}

	@Override
	public int solecount(SoleSearchCriteria solesearchcriteria) {
		
		return sqlSession.selectOne(namespace + ".solecount", solesearchcriteria);
	}

}
