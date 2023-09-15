package com.edu.sole.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.edu.sole.dto.RecipedSoleDTO;
import com.edu.sole.dto.SoleSearchCriteria;
import com.edu.sole.dto.base.BaseSoleDTO;
import com.edu.sole.dto.base.BaseSoleSearchCriteria;
import com.edu.sole.dto.LiveSoleDTO;
import com.edu.sole.dto.recipe.LikedDTO;
import com.edu.sole.dto.recipe.LikedSelectDTO;
import com.edu.sole.dto.recipe.RecipeDTO;
import com.edu.sole.dto.recipe.RecipeReviewDTO;
import com.edu.sole.dto.recipe.ReviewCriteria;

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
	
	// 리뷰 Insert
	@Override
	public void soleReviewInsert(Map articleMap) throws Exception {
		
		String review_id = selectReviewID();
		
		logger.info("review_id" + review_id);
		
		articleMap.put("review_id", review_id);
		sqlSession.insert(namespace + ".soleReviewInsert", articleMap);
		
	}
	
	// review_id 정하는 메소드
	private String selectReviewID() throws Exception {
		
		String review_id = sqlSession.selectOne(namespace + ".selectReviewID");
		
		return review_id; 
	}
	
	// 리뷰 정보 끌어오는
	@Override
	public List<RecipeReviewDTO> selectReview(ReviewCriteria reviewcri) throws Exception {
		
		return sqlSession.selectList(namespace + ".selectReview", reviewcri);
	}
	
	// 리뷰 총 개수
	@Override
	public int reviewcount(ReviewCriteria reviewcri) throws Exception {
		
		return sqlSession.selectOne(namespace + ".reviewcount", reviewcri);
	}
	
	// 찜 인설트
	@Override
	public void jjimInsert(LikedDTO jjimInsert) throws Exception {
		
		String liked_id = selectLikedId();
		jjimInsert.setLiked_id(liked_id);
		
		sqlSession.insert(namespace + ".jjimInsert", jjimInsert);
		
	}
	
	// liked_id 정하는 메소드
	private String selectLikedId() throws Exception {
		String liked_id = sqlSession.selectOne(namespace + ".selectLikedId");
		
		return liked_id;
	}
	
	// 찜 셀렉하는
	@Override
	public LikedDTO jjimSelect(LikedSelectDTO Wla) throws Exception {
		
		return sqlSession.selectOne(namespace + ".jjimSelect", Wla);
	}
	
	// 찜 딜리트
	@Override
	public void jjimDelete(LikedDTO jjimDelete) throws Exception {
		
		sqlSession.delete(namespace + ".jjimDelte", jjimDelete);
	}
	
	// 베이스주 셀렉
	@Override
	public List<BaseSoleDTO> selectbase(BaseSoleSearchCriteria cri) {
		
		return sqlSession.selectList(namespace + ".selectbase", cri);
	}
	
	// 베이스주 총 개수 구하는
	@Override
	public int basecount(BaseSoleSearchCriteria cri) {
		
		return sqlSession.selectOne(namespace + ".basecount", cri);
	}

	//술 리뷰쓰는 페이지에서 강제로 목록으로 보낼려고 카테고리 가져오는
	@Override
	public String getCategory(String recipe_code) {
		
		return sqlSession.selectOne(namespace + ".getCategory", recipe_code);
	}
	
	
} // end class
