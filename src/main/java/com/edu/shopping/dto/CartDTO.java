package com.edu.shopping.dto;

//실어나르는 값
public class CartDTO {
	private int cart_number;
	private String product_id;
	private String member_id;
	private int total_price;
	public int getCart_number() {
		return cart_number;
	}
	public void setCart_number(int cart_number) {
		this.cart_number = cart_number;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_number=" + cart_number + ", product_id=" + product_id + ", member_id=" + member_id
				+ ", total_price=" + total_price + "]";
	}
}
