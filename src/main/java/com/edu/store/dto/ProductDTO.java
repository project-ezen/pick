package com.edu.store.dto;

// 실어 나르는 값
public class ProductDTO {
	private String product_id;
	private String display_product_id;
	private int category_code;
	private int product_stock;			// 재고
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getDisplay_product_id() {
		return display_product_id;
	}
	public void setDisplay_product_id(String display_product_id) {
		this.display_product_id = display_product_id;
	}
	public int getCategory_code() {
		return category_code;
	}
	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}
	public int getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}
	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", display_product_id=" + display_product_id
				+ ", category_code=" + category_code + ", product_stock=" + product_stock + "]";
	}
}
