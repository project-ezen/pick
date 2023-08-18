package com.edu.member.dto;

import java.sql.Date;

public class MemberDTO {
	private	String	id;
	private String	passwd;
	private	String	repasswd;
	private	String	name;
	private	Date	reg_date;
	private	String	tel;
	private String  zipcode;
	private	String	address1;
	private	String	address2;
	private	String	email;
	
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", passwd=" + passwd + ", repasswd=" + repasswd + ", name=" + name
				+ ", reg_date=" + reg_date + ", tel=" + tel + ", zipcode=" + zipcode + ", address1=" + address1
				+ ", address2=" + address2 + ", email=" + email + "]";
	}
	
	
	
}
