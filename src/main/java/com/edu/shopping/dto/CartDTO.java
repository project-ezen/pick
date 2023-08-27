package com.edu.shopping.dto;

//실어나르는 값
public class CartDTO {
	private String cart_id;
	private String member_id;
	
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", member_id=" + member_id + "]";
	}
}
