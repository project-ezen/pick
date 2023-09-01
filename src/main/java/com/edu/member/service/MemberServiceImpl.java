package com.edu.member.service;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.board.dto.BoardDTO;
import com.edu.member.dao.MemberDAO;
import com.edu.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

//-------------------------------------------------------------------------------
	
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
	
	//회원 상세 정보 get
	@Override
	public MemberDTO detail(String id) throws Exception {
		return memberDAO.detail(id);
	}
	
	//회원 정보 수정 POST
	@Override
	public void edit(MemberDTO memberDTO) throws Exception {
		memberDAO.edit(memberDTO);	
	}

//-------------------------------------------------------------------------------

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
	
	//아이디 찾기 POST
	@Override
	public int checkNameAndTel(MemberDTO memberDTO) throws Exception {
		int result = memberDAO.checkNameAndTel(memberDTO);
		return result;
    } // 이름과 전화번호로 인증번호 받기
	
	@Override
	public int checkNameAndNick(MemberDTO memberDTO) throws Exception {
		int result = memberDAO.checkNameAndNick(memberDTO);
		return result;
	} // 이름과 닉네임으로 인증번호 받기
	
	//비밀번호 찾기 POST
	@Override
	public int checkIDAndTel(MemberDTO memberDTO) throws Exception {
		int result = memberDAO.checkIDAndTel(memberDTO);
		return result;
	} // 아이디와 전화번호로 인증번호 받기

	

//-------------------------------------------------------------------------------
	//내가 쓴 게시물
	@Override
	public MemberDTO myboardList(String m_id) throws Exception {
		logger.info("아아");
		return memberDAO.myboardList(m_id);
	}


}
