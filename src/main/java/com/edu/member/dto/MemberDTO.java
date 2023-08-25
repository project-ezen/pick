package com.edu.member.dto;

import java.sql.Date;

public class MemberDTO {
	private	String	id;
	private String	passwd;
	private	String	repasswd;
	private	String	name;
	private String 	nickname;
	private String	phoneNumber;
	private String 	gender;
	private	Date	reg_date;
	private String  zipcode;
	private	String	address1;
	private	String	addressDetail;
	private int 	birthdate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getRepasswd() {
		return repasswd;
	}
	public void setRepasswd(String repasswd) {
		this.repasswd = repasswd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public int getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(int birthdate) {
		this.birthdate = birthdate;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", passwd=" + passwd + ", repasswd=" + repasswd + ", name=" + name
				+ ", nickname=" + nickname + ", phoneNumber=" + phoneNumber + ", gender=" + gender + ", reg_date="
				+ reg_date + ", zipcode=" + zipcode + ", address1=" + address1 + ", addressDetail=" + addressDetail
				+ ", birthdate=" + birthdate + "]";
	}
	
	

	
	
}
