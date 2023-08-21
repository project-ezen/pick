package com.edu.sole.service;

import java.util.List;

import javax.inject.Inject;

import com.edu.sole.DAO.soleDAO;
import com.edu.sole.DTO.SoleSearchCriteria;
import com.edu.sole.DTO.liveSoleDTO;

public interface soleService {
	
	// 술 목록 보여주는
	public List<liveSoleDTO> soleMain(SoleSearchCriteria solesearchcriteria);
	
	//술 목록의 총 개수
	public int solecount(SoleSearchCriteria solesearchcriteria);
}
