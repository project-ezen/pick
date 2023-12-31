package com.edu.store.dto;

// 실어 나르는 값
public class ProductDTO {
	private int product_id;
	private String product_display_id;
	private String product_name;
	private String product_image;
	private int product_price;
	private int category_code;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_display_id() {
		return product_display_id;
	}
	public void setProduct_display_id(String product_display_id) {
		this.product_display_id = product_display_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getCategory_code() {
		return category_code;
	}
	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}
	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", product_display_id=" + product_display_id + ", product_name="
				+ product_name + ", product_image=" + product_image + ", product_price=" + product_price
				+ ", category_code=" + category_code + "]";
	}
}
