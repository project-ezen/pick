package com.edu.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.edu.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);

	//namespace
	private static final String namespace = "memberMapper";
	
//---------------------------------------------------------------------------
	
	//로그인 POST
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		
		logger.info("memberDTO : " + memberDTO);
		
		//  return sqlSession.selectOne(namespace + ".login", memberDTO);
		
		MemberDTO mDTO = sqlSession.selectOne(namespace + ".login", memberDTO);
		System.out.println("DAO =====> " + mDTO);
		return mDTO;
	}
	
	//회원가입
	@Override
	public int join(MemberDTO memberDTO) throws Exception {
		
		logger.info("memberDTO : " + memberDTO);
		
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

	//회원 상세 정보 GET
	@Override
	public MemberDTO detail(String id) throws Exception {
		return sqlSession.selectOne(namespace + ".detail" , id);
	}
	
	//회원 정보 수정
	@Override
	public void edit(MemberDTO memberDTO) throws Exception {
		sqlSession.update(namespace + ".edit", memberDTO);
	}

	

	
}
