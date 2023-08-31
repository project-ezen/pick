package com.edu.store.dto;

// 실어 나르는 값
public class ProductDTO {
	private String product_id;
	private String product_display_id;
	private String cart_id;
	private String order_id;
	private int count;
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_display_id() {
		return product_display_id;
	}
	public void setProduct_display_id(String product_display_id) {
		this.product_display_id = product_display_id;
	}
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", product_display_id=" + product_display_id + ", cart_id="
				+ cart_id + ", order_id=" + order_id + ", count=" + count + "]";
	}
}
