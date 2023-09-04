package com.edu.sole.dto.recipe;

public class RecipeReviewDTO {
	private String review_id;
	private String m_id;
	private String recipe_code;
	private String ingredient_number;
	private String content;
	private String image;
	private String writedate;
	private String star;
	private int		rwm;
	
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public int getRwm() {
		return rwm;
	}
	public void setRwm(int rwm) {
		this.rwm = rwm;
	}
	@Override
	public String toString() {
		return "RecipeReviewDTO [review_id=" + review_id + ", m_id=" + m_id + ", recipe_code=" + recipe_code
				+ ", ingredient_number=" + ingredient_number + ", content=" + content + ", image=" + image
				+ ", writedate=" + writedate + ", star=" + star + ", rwm=" + rwm + "]";
	}
	
	
	
}
