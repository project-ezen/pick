package com.edu.shopping.dto;

import java.sql.Date;

// 실어나르는 값
public class OrderDTO {

	private String 	receiver_name;		//받는이
	private String 	receiver_phonenum;	//받는사람 번호	
	private String 	order_id;			//주문번호
	private String 	m_id;				//회원 아이디
	private int 	final_price;		//최종가격
	private int 	zipcode;			//우편번호
	private String 	address;			//주소
	private String 	address_detail;		//상세 주소
	private Date	order_date;			//주문 날짜
	
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
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	@Override
	public String toString() {
		return "OrderDTO [receiver_name=" + receiver_name + ", receiver_phonenum=" + receiver_phonenum + ", order_id="
				+ order_id + ", m_id=" + m_id + ", final_price=" + final_price + ", zipcode=" + zipcode + ", address="
				+ address + ", address_detail=" + address_detail + ", order_date=" + order_date + "]";
	}
}
