package com.edu.sole.DAO;

import java.util.List;

import com.edu.sole.DTO.SoleSearchCriteria;
import com.edu.sole.DTO.liveSoleDTO;

public interface soleDAO {
	
	public List<liveSoleDTO> soleMain(SoleSearchCriteria solesearchcriteria);
	
	public int solecount(SoleSearchCriteria solesearchcriteria);
	
}
