package com.edu.sole.dto.base;

public class BaseSoleSearchCriteria extends BaseSoleCriteria {

	private String  sole_jongryu;
	private int 	alcohole_category;
	private String  keyword;
	
	public String getSole_jongryu() {
		return sole_jongryu;
	}
	public void setSole_jongryu(String sole_jongryu) {
		this.sole_jongryu = sole_jongryu;
	}
	public int getAlcohole_category() {
		return alcohole_category;
	}
	public void setAlcohole_category(int alcohole_category) {
		this.alcohole_category = alcohole_category;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "BaseSoleSearchCriteria [sole_jongryu=" + sole_jongryu + ", alcohole_category=" + alcohole_category
				+ ", keyword=" + keyword + "]";
	}
	
	
	
	
	
	

	
} // end class
