package com.edu.store.dto;

// 거의 고정된 값
public class ProductDisplayVO {
	private String product_display_id;
	private String product_info;
	private String capacity;
	private String alcohol_content;
	private String origin;
	private String manufacturer;
	
	public String getProduct_display_id() {
		return product_display_id;
	}
	public void setProduct_display_id(String product_display_id) {
		this.product_display_id = product_display_id;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getAlcohol_content() {
		return alcohol_content;
	}
	public void setAlcohol_content(String alcohol_content) {
		this.alcohol_content = alcohol_content;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	@Override
	public String toString() {
		return "ProductDisplayVO [product_display_id=" + product_display_id + ", product_info=" + product_info
				+ ", capacity=" + capacity + ", alcohol_content=" + alcohol_content + ", origin=" + origin
				+ ", manufacturer=" + manufacturer + "]";
	}
}
