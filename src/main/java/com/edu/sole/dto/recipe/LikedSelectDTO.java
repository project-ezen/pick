package com.edu.sole.dto.recipe;

public class LikedSelectDTO {
	
	private String recipe_code;
	private String m_id;
	
	public String getRecipe_code() {
		return recipe_code;
	}
	public void setRecipe_code(String recipe_code) {
		this.recipe_code = recipe_code;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	@Override
	public String toString() {
		return "JjimSelectDTO [recipe_code=" + recipe_code + ", m_id=" + m_id + "]";
	}
	
	
}
