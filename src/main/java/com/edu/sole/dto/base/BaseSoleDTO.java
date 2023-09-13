package com.edu.sole.dto.base;

public class BaseSoleDTO {
	private String 	base_alcohole_id;
	private int 	alcohole_category;
	private String  alcohole_name;
	private String  alcohole_image;
	private String  sole_jongryu;
	private int 	rwm;
	
	public String getBase_alcohole_id() {
		return base_alcohole_id;
	}
	public void setBase_alcohole_id(String base_alcohole_id) {
		this.base_alcohole_id = base_alcohole_id;
	}
	public int getAlcohole_category() {
		return alcohole_category;
	}
	public void setAlcohole_category(int alcohole_category) {
		this.alcohole_category = alcohole_category;
	}
	public String getAlcohole_name() {
		return alcohole_name;
	}
	public void setAlcohole_name(String alcohole_name) {
		this.alcohole_name = alcohole_name;
	}
	public String getAlcohole_image() {
		return alcohole_image;
	}
	public void setAlcohole_image(String alcohole_image) {
		this.alcohole_image = alcohole_image;
	}
	public String getSole_jongryu() {
		return sole_jongryu;
	}
	public void setSole_jongryu(String sole_jongryu) {
		this.sole_jongryu = sole_jongryu;
	}
	public int getRwm() {
		return rwm;
	}
	public void setRwm(int rwm) {
		this.rwm = rwm;
	}
	@Override
	public String toString() {
		return "BaseSoleDTO [base_alcohole_id=" + base_alcohole_id + ", alcohole_category=" + alcohole_category
				+ ", alcohole_name=" + alcohole_name + ", alcohole_image=" + alcohole_image + ", sole_jongryu="
				+ sole_jongryu + ", rwm=" + rwm + "]";
	}
	
	
	
}
