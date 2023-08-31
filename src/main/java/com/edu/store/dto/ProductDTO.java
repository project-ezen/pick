package com.edu.store.dto;

// 실어 나르는 값
public class ProductDTO {
	private String product_id;
	private String product_display_id;
	private String name;
	private String product_image;
	private int product_price;
	private int category_code;
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_display_id() {
		return product_display_id;
	}
	public void setProduct_display_id(String product_display_id) {
		this.product_display_id = product_display_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
		return "ProductDTO [product_id=" + product_id + ", product_display_id=" + product_display_id + ", name=" + name
				+ ", product_image=" + product_image + ", product_price=" + product_price + ", category_code="
				+ category_code + "]";
	}
}
