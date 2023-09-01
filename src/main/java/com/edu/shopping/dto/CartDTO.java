package com.edu.shopping.dto;

//실어나르는 값
public class CartDTO {
	private String cart_id;
	private String m_id;
	private String product_id;
	private int cart_number;
	private int count;
	
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getCart_number() {
		return cart_number;
	}
	public void setCart_number(int cart_number) {
		this.cart_number = cart_number;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", m_id=" + m_id + ", product_id=" + product_id + ", cart_number="
				+ cart_number + ", count=" + count + "]";
	}
}
