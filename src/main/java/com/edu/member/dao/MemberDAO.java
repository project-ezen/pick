package com.edu.member.dao;

import com.edu.member.dto.MemberDTO;

public interface MemberDAO {

	
	//로그인 POST
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	
//---------------------------------------------------------------------------
	//회원가입
	public int join(MemberDTO memberDTO) throws Exception;

	//회원 상세 정보 GET
	public MemberDTO memberDetail(String id) throws Exception; 
	
	//회원 정보 수정 POST
	public void memberUpdate(MemberDTO memberDTO) throws Exception;
		
	//아이디 중복 검사
	public int idCheck(MemberDTO memberDTO) throws Exception;
	
	//닉네임 중복 검사
	public int nickCheck(MemberDTO memberDTO) throws Exception;
	
//------------------------------------------------------------------------------	

	
//---------------------------------------------------------------------------
	//내가 쓴 게시물
	//public MemberDTO myboard(String id) throws Exception;
	
}
