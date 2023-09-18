package com.edu.sole.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.edu.sole.dao.SoleDAO;
import com.edu.sole.dto.SoleSearchCriteria;
import com.edu.sole.dto.base.BaseSoleDTO;
import com.edu.sole.dto.base.BaseSoleSearchCriteria;
import com.edu.sole.dto.recipe.LikedDTO;
import com.edu.sole.dto.recipe.LikedSelectDTO;
import com.edu.sole.dto.recipe.RecipeDTO;
import com.edu.sole.dto.recipe.RecipeReviewDTO;
import com.edu.sole.dto.recipe.ReviewCriteria;
import com.edu.sole.dto.LiveSoleDTO;
import com.edu.sole.dto.RecipedSoleDTO;

public interface SoleService {
	
	// 술 목록 보여주는
	public List<LiveSoleDTO> soleMain(SoleSearchCriteria solesearchcriteria);
	
	//술 목록의 총 개수
	public int solecount(SoleSearchCriteria solesearchcriteria);
		
	// 술 상세한 레시피 가져오는
	public List<RecipeDTO> solerecipeDetail(String recipe_code) throws Exception;

	// 술 정보를 가져오는
	public RecipedSoleDTO solerecipe(String recipe_code) throws Exception;

	// 리뷰 Insert
	public void soleReviewInsert(Map articleMap) throws Exception;
	
	//리뷰 정보 끌어오는
	public List<RecipeReviewDTO> selectReview(ReviewCriteria reviewcri) throws Exception;
	
	// 리뷰 개수
	public int reviewcount(ReviewCriteria reviewcri) throws Exception;
	
	//찜 인설트
	public void likedInsert(LikedDTO likedInsert) throws Exception;
	
	//찜 셀렉하는거
	public LikedDTO likedSelect(LikedSelectDTO Wla) throws Exception;
	
	// 찜 딜리트
	public void likedDelete(LikedDTO likedDelete) throws Exception;
	
	//베이스주 셀렉
	public List<BaseSoleDTO> selectbase(BaseSoleSearchCriteria cri);
	
	//베이스주 총개수
	public int basecount(BaseSoleSearchCriteria cri);
	
	//술 리뷰쓰는 페이지에서 강제로 목록으로 보낼려고 카테고리 가져오는
	public String getCategory(String recipe_code);
}
