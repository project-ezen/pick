package com.edu.sole.dao;

import java.util.List;

import com.edu.sole.dto.SoleSearchCriteria;
import com.edu.sole.dto.recipe.RecipeDTO;
import com.edu.sole.dto.LiveSoleDTO;
import com.edu.sole.dto.RecipedSoleDTO;

public interface SoleDAO {
	
	public List<LiveSoleDTO> soleMain(SoleSearchCriteria solesearchcriteria);
	
	public int solecount(SoleSearchCriteria solesearchcriteria);
	
	// 술  상세 레시피 구하는
	public List<RecipeDTO> solerecipeDetail(String recipe_code) throws Exception;

	// 술 정보를 가져오는
	public RecipedSoleDTO solerecipe(String recipe_code) throws Exception;
	
}
