package com.edu.store.dto;

// 실어 나르는 값
public class ProductDTO {

	private String cart_id;
	private String product_display_id;
	private String product_id;
	private int category_code;
  
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}
  
	public String getProduct_display_id() {
		return product_display_id;
	}
  
	public void setProduct_display_id(String product_display_id) {
		this.product_display_id = product_display_id;
	}

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
  
	@Override
	public String toString() {
		return "ProductDTO [cart_id=" + cart_id + ", product_display_id=" + product_display_id + ", product_id="
				+ product_id + ", category_code=" + category_code + "]";

	}
}
