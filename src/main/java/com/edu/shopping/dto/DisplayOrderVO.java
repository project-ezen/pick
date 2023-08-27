package com.edu.shopping.dto;

public class DisplayOrderVO {
	private String image;
	private String name;
	private String price;
	private String count;
	public DisplayOrderVO(String image, String name, String price, String count) {
		this.image = image; this.name = name; this.price = price; this.count = count;
	}
	public DisplayOrderVO() {
		
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
		return "DisplayOrderDTO [image=" + image + ", name=" + name + ", price=" + price + ", count=" + count + "]";
	}
}
