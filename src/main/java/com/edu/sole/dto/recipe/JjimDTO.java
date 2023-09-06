package com.edu.sole.dto.recipe;

public class JjimDTO {
	private String liked_id;
	private String m_id;
	private String recipe_code;
	private String ingredient_number;
	
	public String getLiked_id() {
		return liked_id;
	}
	public void setLiked_id(String liked_id) {
		this.liked_id = liked_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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
	@Override
	public String toString() {
		return "JjimInsertDTO [liked_id=" + liked_id + ", m_id=" + m_id + ", recipe_code=" + recipe_code
				+ ", ingredient_number=" + ingredient_number + "]";
	}
	
	
}
