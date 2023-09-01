package com.edu.member.dto;

import java.sql.Date;
import java.util.List;

import com.edu.board.dto.BoardDTO;

public class MemberDTO {
	private	String	m_id;
	private String	m_pw;
	private	String	m_repw;
	private	String	m_name;
	private String 	m_nickname;
	private String	m_tel;
	private int 	m_birthdate;
	private String 	m_gender;
	private String  m_zipcode;
	private	String	m_address;
	private	String	m_addressDetail;
	private	Date	m_datetime;
	
	private List<BoardDTO> myPageList; 	//게시판 N 관계의 정보를 가져온 선언

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_repw() {
		return m_repw;
	}

	public void setM_repw(String m_repw) {
		this.m_repw = m_repw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public int getM_birthdate() {
		return m_birthdate;
	}

	public void setM_birthdate(int m_birthdate) {
		this.m_birthdate = m_birthdate;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_zipcode() {
		return m_zipcode;
	}

	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_addressDetail() {
		return m_addressDetail;
	}

	public void setM_addressDetail(String m_addressDetail) {
		this.m_addressDetail = m_addressDetail;
	}

	public Date getM_datetime() {
		return m_datetime;
	}

	public void setM_datetime(Date m_datetime) {
		this.m_datetime = m_datetime;
	}

	public List<BoardDTO> getMyPageList() {
		return myPageList;
	}

	public void setMyPageList(List<BoardDTO> myPageList) {
		this.myPageList = myPageList;
	}

	@Override
	public String toString() {
		return "MemberDTO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_repw=" + m_repw + ", m_name=" + m_name
				+ ", m_nickname=" + m_nickname + ", m_tel=" + m_tel + ", m_birthdate=" + m_birthdate + ", m_gender="
				+ m_gender + ", m_zipcode=" + m_zipcode + ", m_address=" + m_address + ", m_addressDetail="
				+ m_addressDetail + ", m_datetime=" + m_datetime + ", myPageList=" + myPageList + "]";
	}
	
	//-----------------------------------------------------------------------
	
}
