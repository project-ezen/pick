package com.edu.sole.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.edu.sole.dto.RecipedSoleDTO;
import com.edu.sole.dto.SoleSearchCriteria;
import com.edu.sole.dto.LiveSoleDTO;
import com.edu.sole.dto.recipe.RecipeDTO;

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
		logger.info("술 메인의 solesearchcriteria" + solesearchcriteria);
		return sqlSession.selectList(namespace + ".soleMain", solesearchcriteria);
		// return sqlSession.selectList(namespace + ".soleMain", livesoleDTO);
	}

	@Override
	public int solecount(SoleSearchCriteria solesearchcriteria) {

		logger.info("술 카운트의 solesearchcriteria" + solesearchcriteria);
		return sqlSession.selectOne(namespace + ".solecount", solesearchcriteria);
	}


	////////////////////////// 술 디테일 부분 ///////////////////////////////////////////////////////////////////////////
	//술 레시피 구하는
	@Override
	public List<RecipeDTO> solerecipeDetail(String recipe_code) throws Exception {

		return sqlSession.selectList(namespace + ".solerecipeDetail", recipe_code);
	}

	// 술 정보 구하는
	@Override
	public RecipedSoleDTO solerecipe(String recipe_code) throws Exception {

		return sqlSession.selectOne(namespace + ".solerecipe", recipe_code);
	}

}