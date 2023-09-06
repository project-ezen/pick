package com.edu.sole.dao;

import java.util.List;
import java.util.Map;

import com.edu.sole.dto.SoleSearchCriteria;
import com.edu.sole.dto.recipe.JjimDTO;
import com.edu.sole.dto.recipe.JjimSelectDTO;
import com.edu.sole.dto.recipe.RecipeDTO;
import com.edu.sole.dto.recipe.RecipeReviewDTO;
import com.edu.sole.dto.recipe.ReviewCriteria;
import com.edu.sole.dto.LiveSoleDTO;
import com.edu.sole.dto.RecipedSoleDTO;

public interface SoleDAO {
	
	// 목록 뽑는
	public List<LiveSoleDTO> soleMain(SoleSearchCriteria solesearchcriteria);
	
	// 개수 설정
	public int solecount(SoleSearchCriteria solesearchcriteria);
	
	// 술  상세 레시피 구하는
	public List<RecipeDTO> solerecipeDetail(String recipe_code) throws Exception;

	// 술 정보를 가져오는
	public RecipedSoleDTO solerecipe(String recipe_code) throws Exception;
	
	// 리뷰 Insert
	public void soleReviewInsert(Map articleMap) throws Exception;
	
	// 리뷰 정보 끌어오는
	public List<RecipeReviewDTO> selectReview(ReviewCriteria reviewcri) throws Exception;
	
	// 리뷰 개수
	public int reviewcount(ReviewCriteria reviewcri) throws Exception;
	
	// 찜 인설트
	public void jjimInsert(JjimDTO jjimInsert) throws Exception;
	
	//찜 셀렉하는
	public JjimDTO jjimSelect(JjimSelectDTO Wla) throws Exception;
	
	// 찜 딜리트
	public void jjimDelete(JjimDTO jjimDelete) throws Exception;
}
