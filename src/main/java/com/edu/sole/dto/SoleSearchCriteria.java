package com.edu.sole.dto;


//--------------------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------------
public class SoleSearchCriteria extends SoleCriteria {

	private String  keyword;			// 검색 키워드 : 검색할 내용
	private String 	dosu;       // 도수
	private String 	mat;		//맛
	
	public String getMat() {
		return mat;
	}
	public void setMat(String mat) {
		this.mat = mat;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	public String getdosu() {
		return dosu;
	}
	public void setdosu(String dosu) {
		this.dosu = dosu;
	}
	@Override
	public String toString() {
		return "SoleSearchCriteria [keyword=" + keyword + ", dosu=" + dosu + ", mat=" + mat + "]";
	}

	
	
	


	
	
	
} // end class
