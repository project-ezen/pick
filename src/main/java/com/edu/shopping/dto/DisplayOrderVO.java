package com.edu.shopping.dto;

public class DisplayOrderVO {
	private String image;
	private String name;
	private String price;
	private String count;
	private String cart_id;
	public DisplayOrderVO(String cart_id, String image, String name, String price, String count) {
		this.cart_id = cart_id; this.image = image; this.name = name; this.price = price; this.count = count;
	}
	public DisplayOrderVO() {
		
	}
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "DisplayOrderVO [image=" + image + ", name=" + name + ", price=" + price + ", count=" + count
				+ ", cart_id=" + cart_id + "]";
	}
}
