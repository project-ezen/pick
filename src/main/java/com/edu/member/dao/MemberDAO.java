package com.edu.member.dao;

import com.edu.member.dto.MemberDTO;

public interface MemberDAO {

	//로그인 화면 get
	
	//로그인 POST
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
}
