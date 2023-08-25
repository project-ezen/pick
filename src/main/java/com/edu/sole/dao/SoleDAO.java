package com.edu.sole.dao;

import java.util.List;

import com.edu.sole.dto.SoleSearchCriteria;
import com.edu.sole.dto.LiveSoleDTO;

public interface SoleDAO {
	
	public List<LiveSoleDTO> soleMain(SoleSearchCriteria solesearchcriteria);
	
	public int solecount(SoleSearchCriteria solesearchcriteria);
	
}
