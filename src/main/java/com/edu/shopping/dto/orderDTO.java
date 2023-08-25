package com.edu.shopping.dto;

//실어나르는 값
public class orderDTO {
	private String receiver_name;
	private int receiver_phonenum;
	private int order_number;
	private int cart_number;
	private int final_price;
	private int zipcode;
	private String address;				//기본주소
	private String address_detail;		//상세주소
	

	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public int getReceiver_phonenum() {
		return receiver_phonenum;
	}
	public void setReceiver_phonenum(int receiver_phonenum) {
		this.receiver_phonenum = receiver_phonenum;
	}
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public int getCart_number() {
		return cart_number;
	}
	public void setCart_number(int cart_number) {
		this.cart_number = cart_number;
	}
	public int getFinal_price() {
		return final_price;
	}
	public void setFinal_price(int final_price) {
		this.final_price = final_price;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	@Override
	public String toString() {
		return "orderDTO [receiver_name=" + receiver_name + ", receiver_phonenum=" + receiver_phonenum
				+ ", order_number=" + order_number + ", cart_number=" + cart_number + ", final_price=" + final_price
				+ ", zipcode=" + zipcode + ", address=" + address + ", address_detail=" + address_detail + "]";
	}
}
