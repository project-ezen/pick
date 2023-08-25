package com.edu.sole.service;

import java.util.List;

import javax.inject.Inject;

import com.edu.sole.dao.SoleDAO;
import com.edu.sole.dto.SoleSearchCriteria;
import com.edu.sole.dto.LiveSoleDTO;

public interface SoleService {
	
	// 술 목록 보여주는
	public List<LiveSoleDTO> soleMain(SoleSearchCriteria solesearchcriteria);
	
	//술 목록의 총 개수
	public int solecount(SoleSearchCriteria solesearchcriteria);
}
