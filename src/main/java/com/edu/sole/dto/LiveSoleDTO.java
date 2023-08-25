package com.edu.sole.dto;

public class LiveSoleDTO {
	private String 	live_alcohole_id;
	private int 	alcohole_level;
	private String  content;
	private String  alcohole_name;
	private String  recipe_image;
	private String  favor;
	private int 	rwm;
	
	public String getLive_alcohole_id() {
		return live_alcohole_id;
	}
	public void setLive_alcohole_id(String live_alcohole_id) {
		this.live_alcohole_id = live_alcohole_id;
	}
	public int getAlcohole_level() {
		return alcohole_level;
	}
	public void setAlcohole_level(int alcohole_level) {
		this.alcohole_level = alcohole_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAlcohole_name() {
		return alcohole_name;
	}
	public void setAlcohole_name(String alcohole_name) {
		this.alcohole_name = alcohole_name;
	}
	public String getRecipe_image() {
		return recipe_image;
	}
	public void setRecipe_image(String recipe_image) {
		this.recipe_image = recipe_image;
	}
	public String getFavor() {
		return favor;
	}
	public void setFavor(String favor) {
		this.favor = favor;
	}
	
	
	public int getRwm() {
		return rwm;
	}
	public void setRwm(int rwm) {
		this.rwm = rwm;
	}
	@Override
	public String toString() {
		return "liveSoleDTO [live_alcohole_id=" + live_alcohole_id + ", alcohole_level=" + alcohole_level + ", content="
				+ content + ", alcohole_name=" + alcohole_name + ", recipe_image=" + recipe_image + ", favor=" + favor
				+ "]";
	}
	
}
