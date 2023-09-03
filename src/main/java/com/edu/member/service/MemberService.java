package com.edu.member.service;

import java.util.List;

import com.edu.board.dto.BoardDTO;
import com.edu.member.dto.MemberDTO;

// 멤버 관련
public interface MemberService {

	//로그인 post => 있는지 확인
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	
	//회원가입
	public int join(MemberDTO memberDTO) throws Exception;


//------------------------------------------------------------------------------
	
	//아이디 중복 검사
	public int idCheck(MemberDTO memberDTO) throws Exception;
	
	//닉네임 중복 검사
	public int nickCheck(MemberDTO memberDTO) throws Exception;
	
	//아이디 찾기 post
	public int checkNameAndTel(MemberDTO memberDTO) throws Exception; // 이름과 전화번호로 인증번호 받기
	public int checkNameAndNick(MemberDTO memberDTO) throws Exception; // 이름과 닉네임으로 인증번호 받기
	
	public String findID(String m_tel) throws Exception; // 인증번호 맞으면 아이디 받아오기
	public String findID2(String m_nickname) throws Exception; // 인증번호 맞으면 아이디 받아오기
	
	
	//비밀번호 찾기 post
	public int checkIDAndTel(MemberDTO memberDTO) throws Exception; // 아이디와 전화번호로 인증번호 받기
	
	public String findPW(String m_id) throws Exception; // 인증번호 맞으면 비밀번호 받아오기
	
	//회원 상세 정보 get
	public MemberDTO detail(String id) throws Exception;

	//회원 정보 수정 POST
	public void edit(MemberDTO memberDTO) throws Exception;
	
	// 회원목록 가져오기
	public List<MemberDTO> selectMember() throws Exception;
//-------------------------------------------------------------------------------
	//내가 쓴 게시물

	public MemberDTO myboardList(String m_id) throws Exception;

	
}
