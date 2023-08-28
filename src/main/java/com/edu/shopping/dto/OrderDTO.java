package com.edu.shopping.dto;

// 실어나르는 값
public class OrderDTO {

	private String 	receiver_name;		//받는이
	private String 	receiver_phonenum;	//받는사람 번호	
	private String 	order_id;			//주문번호
	private String 	cart_id;			//카트번호
	private int 	final_price;		//최종가격
	private int 	zipcode;			//우편번호
	private String 	address;			//주소
	private String 	address_detail;		//상세 주소
	
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public String getReceiver_phonenum() {
		return receiver_phonenum;
	}
	public void setReceiver_phonenum(String receiver_phonenum) {
		this.receiver_phonenum = receiver_phonenum;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
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
		return "OrderDTO [receiver_name=" + receiver_name + ", receiver_phonenum=" + receiver_phonenum + ", order_id="
				+ order_id + ", cart_id=" + cart_id + ", final_price=" + final_price + ", zipcode=" + zipcode
				+ ", address=" + address + ", address_detail=" + address_detail + "]";
	}
}
