package com.edu.sole.dao;

import java.util.List;

import com.edu.sole.soledto.RecipedSoleDTO;
import com.edu.sole.soledto.SoleSearchCriteria;
import com.edu.sole.soledto.liveSoleDTO;
import com.edu.sole.soledto.recipe.recipeDTO;

public interface soleDAO {
	
	// 목록뽑는
	public List<liveSoleDTO> soleMain(SoleSearchCriteria solesearchcriteria);
	
	// 개수 설정
	public int solecount(SoleSearchCriteria solesearchcriteria);
	
	// 술  상세 레시피 구하는
	public List<recipeDTO> solerecipeDetail(String recipe_code) throws Exception;
	
	// 술 정보를 가져오는
	public RecipedSoleDTO solerecipe(String recipe_code) throws Exception;
}
