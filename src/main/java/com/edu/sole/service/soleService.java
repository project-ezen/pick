package com.edu.sole.service;

import java.util.List;

import javax.inject.Inject;

import com.edu.sole.dao.soleDAO;
import com.edu.sole.soledto.RecipedSoleDTO;
import com.edu.sole.soledto.SoleSearchCriteria;
import com.edu.sole.soledto.liveSoleDTO;
import com.edu.sole.soledto.recipe.recipeDTO;

public interface soleService {
	
	// 술 목록 보여주는
	public List<liveSoleDTO> soleMain(SoleSearchCriteria solesearchcriteria);
	
	//술 목록의 총 개수
	public int solecount(SoleSearchCriteria solesearchcriteria);
	
	// 술 상세한 레시피 가져오는
	public List<recipeDTO> solerecipeDetail(String recipe_code) throws Exception;
	
	// 술 정보를 가져오는
	public RecipedSoleDTO solerecipe(String recipe_code) throws Exception;
}
