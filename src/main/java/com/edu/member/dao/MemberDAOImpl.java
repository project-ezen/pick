package com.edu.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.edu.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.edu.member.mapper.memberMapper";
	
	//로그인 화면 get
	
	//로그인 POST
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".login", memberDTO);
	}
	

	
}
