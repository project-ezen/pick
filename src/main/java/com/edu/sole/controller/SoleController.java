package com.edu.sole.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.member.controller.MemberController;
import com.edu.sole.dto.RecipedSoleDTO;
import com.edu.sole.dto.SolePageMaker;
import com.edu.sole.dto.SoleSearchCriteria;
import com.edu.sole.dto.LiveSoleDTO;
import com.edu.sole.dto.recipe.RecipeDTO;
import com.edu.sole.service.SoleService;

@Controller
@RequestMapping("/sole")
public class SoleController {
	
	@Inject
	SoleService soleservice;
	
	private static final Logger logger = LoggerFactory.getLogger(SoleController.class);
	
	//------------------------------------------------------------------------------------------
	// 술 메인
	@RequestMapping(value="/Main", method=RequestMethod.GET)
	public String MainPage() {
		return "/sole/Main";
	}
	
	//------------------------------------------------------------------------------------------
	// 레시피 술 보여주는
	@RequestMapping(value="/sole" , method=RequestMethod.GET)
	public ModelAndView soleMain(HttpServletRequest request, HttpServletResponse response, SoleSearchCriteria solesearchcriteria) {
		
		ModelAndView mav = new ModelAndView();
		
		
		logger.info("solesearchcriteria " + solesearchcriteria.toString());
		SolePageMaker pgm = new SolePageMaker();
		//logger.info("alcohole_category: "+ alcohole_category);
		
		//category.setCategory_code(alcohole_category);
		
		pgm.setCri(solesearchcriteria);
		logger.info("2");
		pgm.setTotalCount(soleservice.solecount(solesearchcriteria));   // cri로 검색한 총 건수를 totalCount 변수에 저장한다.
		logger.info("3");
		List<LiveSoleDTO> soleMain = soleservice.soleMain(solesearchcriteria);
		logger.info("4");
		mav.addObject("sole", soleMain);
		logger.info("5");
		mav.addObject("pagemaker", pgm);	
		logger.info("6");
		mav.addObject("cri",solesearchcriteria);
		logger.info("7");
		
		System.out.println("pgm" + " "+ pgm);
		
		return mav;
		
	}/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//------------------------------------------------------------------------------------------------------
	// sole detail
	@RequestMapping(value="/soleDetail", method=RequestMethod.GET)
	public ModelAndView soleDetail(HttpServletRequest request, HttpServletResponse response, @RequestParam("recipe_code") String recipe_code) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		logger.info("recipe_code : " + recipe_code);
		
		List<RecipeDTO> recipeDetailDTO = soleservice.solerecipeDetail(recipe_code);   // 술 상세한 레시피 보여주는
		
		RecipedSoleDTO recipeDTO = new RecipedSoleDTO();
		
		recipeDTO = soleservice.solerecipe(recipe_code);        // 술 정보를 보여주는
		
		mav.addObject("recipeDetail", recipeDetailDTO);
		mav.addObject("recipe", recipeDTO);
		
		return mav;
		
	}
	
	//---------------------------------------------------------------------------------------------------------------
	// sole detail / review
	@RequestMapping(value="/soleReview", method=RequestMethod.GET)
	public ModelAndView soleReview(@RequestParam("recipe_code") String recipe_code) {
		
		ModelAndView mav = new ModelAndView();
		
		logger.info("recipe_code :" + recipe_code);
		
		mav.addObject("recipe_code", recipe_code);
		
		return mav;
		
	}
}