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
import org.springframework.web.servlet.ModelAndView;

import com.edu.sole.dto.SolePageMaker;
import com.edu.sole.dto.SoleSearchCriteria;
import com.edu.sole.dto.LiveSoleDTO;
import com.edu.sole.service.SoleService;

@Controller
@RequestMapping("/sole")
public class SoleControll {
	
	@Inject
	SoleService soleservice;
	
	private static final Logger logger = LoggerFactory.getLogger(SoleControll.class);
	
	//------------------------------------------------------------------------------------------
	// 레시피 술 보여주는
	@RequestMapping(value="/sole" , method=RequestMethod.GET)
	public ModelAndView soleMain(HttpServletRequest request, HttpServletResponse response, SoleSearchCriteria solesearchcriteria) {
		
		ModelAndView mav = new ModelAndView();
		
		SolePageMaker pgm = new SolePageMaker();
		
		
		logger.info("1");
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
}
