package com.edu.sole.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.edu.sole.dao.SoleDAO;
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

@Service
public class SoleServiceImpl implements SoleService {
	
	private static final Logger logger = LoggerFactory.getLogger(SoleServiceImpl.class);
	
	@Inject
	SoleDAO soledao;
	
	// 술 목록 보여주는
	@Override
	public List<LiveSoleDTO> soleMain(SoleSearchCriteria solesearchcriteria) {
		
		logger.info("서비스 들어감");
		
		return soledao.soleMain(solesearchcriteria);
		
		
	}
	
	// 술 개수 구하는
	@Override
	public int solecount(SoleSearchCriteria solesearchcriteria) {
		
		return soledao.solecount(solesearchcriteria);
	}
	
	// 술 레시피 구하는
	@Override
	public List<RecipeDTO> solerecipeDetail(String recipe_code) throws Exception {
		
		return soledao.solerecipeDetail(recipe_code);
	}
	
	// 술 정보 보여주는
	@Override
	public RecipedSoleDTO solerecipe(String recipe_code) throws Exception {
		
		return soledao.solerecipe(recipe_code);
	}

	// 술 Insert
	@Override
	public void soleReviewInsert(Map articleMap) throws Exception {
		
		soledao.soleReviewInsert(articleMap);
		
	}
	
	// 리뷰 정보 끌어오는
	@Override
	public List<RecipeReviewDTO> selectReview(ReviewCriteria reviewcri) throws Exception {
		
		return soledao.selectReview(reviewcri);
	}
	
	// 리뷰 개수 끌어오는
	@Override
	public int reviewcount(ReviewCriteria reviewcri) throws Exception {
		
		return soledao.reviewcount(reviewcri);
	}
	
	
	// 찜 인설트
	@Override
	public void jjimInsert(LikedDTO jjimInsert) throws Exception {
		
		soledao.jjimInsert(jjimInsert);
	}
	
	// 찜 셀렉하는
	@Override
	public LikedDTO jjimSelect(LikedSelectDTO Wla) throws Exception {
		
		return soledao.jjimSelect(Wla);
	}
	
	// 찜 딜리트
	@Override
	public void jjimDelete(LikedDTO jjimDelete) throws Exception {
		
		soledao.jjimDelete(jjimDelete);
	}
	
	// 베이스주 셀렉
	@Override
	public List<BaseSoleDTO> selectbase(BaseSoleSearchCriteria cri) {
		
		return soledao.selectbase(cri);
	}
	
	// 베이스주 카운트
	@Override
	public int basecount(BaseSoleSearchCriteria cri) {
		
		return soledao.basecount(cri);
	}
	
	//술 리뷰쓰는 페이지에서 강제로 목록으로 보낼려고 카테고리 가져오는
	@Override
	public String getCategory(String recipe_code) {
		
		return soledao.getCategory(recipe_code);
	}
	
	

}
