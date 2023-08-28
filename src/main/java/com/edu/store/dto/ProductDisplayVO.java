package com.edu.store.dto;

// 거의 고정된 값
public class ProductDisplayVO {

	private String 	product_display_id;
	private String 	product_name;
	private String 	product_info;
	private String 	capacity;
	private String 	alcohol_content;
	private String 	origin;
	private String 	manufacturer;
	private String 	product_image;
	private int 	product_price;
  
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
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
  
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
  
	@Override
	public String toString() {
		return "ProductDisplayVO [product_display_id=" + product_display_id + ", product_name=" + product_name
				+ ", product_info=" + product_info + ", capacity=" + capacity + ", alcohol_content=" + alcohol_content
				+ ", origin=" + origin + ", manufacturer=" + manufacturer + ", product_image=" + product_image
				+ ", product_price=" + product_price + "]";
	}
}
