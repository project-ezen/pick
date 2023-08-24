package com.edu.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.edu.member.dao.MemberDAO;
import com.edu.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDAO;

	//로그인 화면 get
	
	//로그인 post => 있는지 확인
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return memberDAO.login(memberDTO);
	}

	//회원가입
	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		int result = memberDAO.join(memberDTO);
		return result;
	}
	
	//아이디 중복 검사
	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {
		int result = memberDAO.idCheck(memberDTO);
		return result;
	}
	
	//닉네임 중복 검사
	@Override
	public int nickCheck(MemberDTO memberDTO) throws Exception {
		int result = memberDAO.nickCheck(memberDTO);
		return result;
	}


	

}
