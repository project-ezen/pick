package com.edu.sole.soledto;

public class RecipedSoleDTO {
	private String 	alcol_id;
	private int 	alcohole_category;
	private String  recipe_code;
	private String  ingredient_number;
	private int		alcohole_level;
	private String	content;
	private String 	alcohole_name;
	private String  alcohole_image;
	private String  favor;
	private int		rwm;
	private int 	alcohole_dosu;
	
	public String getAlcol_id() {
		return alcol_id;
	}
	public void setAlcol_id(String alcol_id) {
		this.alcol_id = alcol_id;
	}
	public int getAlcohole_category() {
		return alcohole_category;
	}
	public void setAlcohole_category(int alcohole_category) {
		this.alcohole_category = alcohole_category;
	}
	public String getRecipe_code() {
		return recipe_code;
	}
	public void setRecipe_code(String recipe_code) {
		this.recipe_code = recipe_code;
	}
	public String getIngredient_number() {
		return ingredient_number;
	}
	public void setIngredient_number(String ingredient_number) {
		this.ingredient_number = ingredient_number;
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
	public String getAlcohole_image() {
		return alcohole_image;
	}
	public void setAlcohole_image(String alcohole_image) {
		this.alcohole_image = alcohole_image;
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
	public int getAlcohole_dosu() {
		return alcohole_dosu;
	}
	public void setAlcohole_dosu(int alcohole_dosu) {
		this.alcohole_dosu = alcohole_dosu;
	}
	
	@Override
	public String toString() {
		return "RecipedSoleDTO [alcol_id=" + alcol_id + ", alcohole_category=" + alcohole_category + ", recipe_code="
				+ recipe_code + ", ingredient_number=" + ingredient_number + ", alcohole_level=" + alcohole_level
				+ ", content=" + content + ", alcohole_name=" + alcohole_name + ", alcohole_image=" + alcohole_image
				+ ", favor=" + favor + "]";
	}
}
