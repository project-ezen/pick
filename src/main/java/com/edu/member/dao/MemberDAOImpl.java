package com.edu.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.edu.board.dto.BoardDTO;
import com.edu.board.dto.JjimDTO;
import com.edu.member.dto.MemberDTO;
import com.edu.sole.dto.recipe.LikedDTO;

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

//---------------------------------------------------------------------------


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
	
	//아이디 찾기 POST
	@Override
	public int checkNameAndTel(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".checkNameAndTel", memberDTO);
    } // 이름과 전화번호로 인증번호 받기
	
	@Override
	public int checkNameAndNick(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".checkNameAndNick", memberDTO);
	} // 이름과 이메일로 인증번호 받기
	
	@Override
    public String findID(String m_tel) throws Exception {
        return sqlSession.selectOne(namespace + ".findID", m_tel);
    } // 인증번호가 맞으면 ID 가져오기
	
	@Override
	public String findID2(String m_nickname) throws Exception {
		return sqlSession.selectOne(namespace + ".findID2", m_nickname);
	} // 인증번호가 맞으면 ID 가져오기
	
	//비밀번호 찾기 POST
	@Override
	public int checkIDAndTel(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(namespace + ".checkIDAndTel", memberDTO);
	} // 아이디와 전화번호로 인증번호 받기

	@Override
	public String findPW(String m_id) throws Exception {
		return sqlSession.selectOne(namespace + ".findPW", m_id);
	} // 인증번호가 맞으면 PW 가져오기
	
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

	// 회원 목록 가져오기
	@Override
	public List<MemberDTO> selectMember() throws Exception {
		return sqlSession.selectList(namespace + ".selectMember");
	}
//-------------------------------------------------------------------------------------
	//내가 쓴 게시물

	@Override
	public MemberDTO myboardList(String mid) throws Exception {
	
		return sqlSession.selectOne(namespace + ".myboard" , mid);
	}

	@Override
	public List<LikedDTO> likeList(String m_id) throws Exception {
		logger.info("좋아요");
		return sqlSession.selectOne(namespace + ".mylikelist" , m_id);
	}

	@Override
	public List<JjimDTO> jjimList(String m_id) throws Exception {
		return sqlSession.selectOne(namespace + ".myjjimlist" , m_id);

	}

	
}
