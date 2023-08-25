package com.edu.sole.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.edu.sole.dao.SoleDAO;
import com.edu.sole.dto.RecipedSoleDTO;
import com.edu.sole.dto.SoleSearchCriteria;
import com.edu.sole.dto.LiveSoleDTO;
import com.edu.sole.dto.recipe.RecipeDTO;

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

}