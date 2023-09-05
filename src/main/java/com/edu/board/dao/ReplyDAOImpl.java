package com.edu.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.edu.board.dto.ReplyDTO;
import com.edu.member.dao.MemberDAOImpl;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOImpl.class);
	
	private static final String namespace="com.edu.board.mappers.replyMapper";
	
	//댓글 목록
	@Override
	public List<ReplyDTO> list(int board_id) throws Exception {
		logger.info("흐엉");
		return sqlSession.selectList(namespace + ".replyList", board_id);
	}

	//댓글 작성
	@Override
	public void write(ReplyDTO replyDTO) throws Exception {
		logger.info("작성");
		sqlSession.insert(namespace + ".replyWrite", replyDTO);
		
	}

	
	//댓글 수정
	@Override
	public void update(ReplyDTO replyDTO) throws Exception {
		logger.info("수정");
		sqlSession.update(namespace + ".replyUpdate", replyDTO);
		
	}
	
	//댓글 삭제
	@Override
	public void delete(ReplyDTO replyDTO) throws Exception {
		logger.info("삭제");
		sqlSession.delete(namespace + ".replyDelete", replyDTO);
		
	}

	
	
	
}
