package com.edu.product.dto;

// 거의 고정된 값
public class ProductDisplayVO {
	private String display_product_id;
	private String product_name;
	private String product_info;
	private String product_image;
	public String getDisplay_product_id() {
		return display_product_id;
	}
	public void setDisplay_product_id(String display_product_id) {
		this.display_product_id = display_product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	@Override
	public String toString() {
		return "ProductDisplayVO [display_product_id=" + display_product_id + ", product_name=" + product_name
				+ ", product_info=" + product_info + ", product_image=" + product_image + "]";
	}
}
