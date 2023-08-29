package com.edu.member.service;

import com.edu.member.dto.MemberDTO;

// 멤버 관련
public interface MemberService {

	//로그인 post => 있는지 확인
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	
	//회원가입
	public int join(MemberDTO memberDTO) throws Exception;
	
	//아이디 중복 검사
	public int idCheck(MemberDTO memberDTO) throws Exception;
	
	//닉네임 중복 검사
	public int nickCheck(MemberDTO memberDTO) throws Exception;
	
	//아이디 찾기 post
	
	
	//비밀번호 찾기 post
	
	
	//회원 상세 정보 수정 get
	public MemberDTO detail(String id) throws Exception;

	//회원 정보 수정 POST
	public void edit(MemberDTO memberDTO) throws Exception;

	//내가 쓴 게시물
	//public MemberDTO myboard(String id) throws Exception;
	
}
