package com.edu.sole.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.edu.sole.DAO.SoleDAO;
import com.edu.sole.DTO.SoleSearchCriteria;
import com.edu.sole.DTO.liveSoleDTO;

@Service
public class SoleServiceImpl implements SoleService {
	
	private static final Logger logger = LoggerFactory.getLogger(SoleServiceImpl.class);
	
	@Inject
	SoleDAO soledao;
	
	// 술 목록 보여주는
	@Override
	public List<liveSoleDTO> soleMain(SoleSearchCriteria solesearchcriteria) {
		
		logger.info("서비스 들어감");
		
		return soledao.soleMain(solesearchcriteria);
		
		
	}
	
	// 술 개수 구하는
	@Override
	public int solecount(SoleSearchCriteria solesearchcriteria) {
		
		return soledao.solecount(solesearchcriteria);
	}

}