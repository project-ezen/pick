package com.edu.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.edu.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;

	//namespace
	private static final String namespace = "memberMapper";
	
	
	//로그인 POST
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".login", memberDTO);
	}
	
	//회원가입
	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(namespace + ".join", memberDTO);
	}
	
	//아이디 중복 검사
	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".idCheck", memberDTO);
	}
	
	//닉네임 중복 검사
	@Override
	public int nickCheck(MemberDTO memberDTO) throws Exception {
		System.out.println("닉네임 중복 검사 ==> " + memberDTO);
		return sqlSession.selectOne(namespace + ".nickCheck", memberDTO);
	}
	

	
}
