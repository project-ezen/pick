package com.edu.sole.dto.recipe;

public class RecipeDTO {

	private String recipe_code;
	private String ingredient_number;
	private String ingredient_name;
	private String ingredient_cpcty;

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
	public String getIngredient_name() {
		return ingredient_name;
	}
	public void setIngredient_name(String ingredient_name) {
		this.ingredient_name = ingredient_name;
	}
	public String getIngredient_cpcty() {
		return ingredient_cpcty;
	}
	public void setIngredient_cpcty(String ingredient_cpcty) {
		this.ingredient_cpcty = ingredient_cpcty;
	}
	@Override
	public String toString() {
		return "recipeDTO [recipe_code=" + recipe_code + ", ingredient_number=" + ingredient_number
				+ ", ingredient_name=" + ingredient_name + ", ingredient_cpcty=" + ingredient_cpcty + "]";
	}





}
