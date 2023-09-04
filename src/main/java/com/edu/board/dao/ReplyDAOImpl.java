package com.edu.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.board.dto.ReplyDTO;
import com.edu.member.dao.MemberDAOImpl;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOImpl.class);
	
	private static final String namespace="com.edu.board.mappers.replyMapper";
	
	
	@Override
	public List<ReplyDTO> list(int board_id) throws Exception {
		logger.info("흐엉");
		return sqlSession.selectList(namespace + ".replyList", board_id);
	}

	
	@Override
	public void write(ReplyDTO replyDTO) throws Exception {
		sqlSession.insert(namespace + ".replyWrite", replyDTO);
		
	}

	@Override
	public void update(ReplyDTO replyDTO) throws Exception {
		sqlSession.update(namespace + ".replyUpdate", replyDTO);
		
	}

	@Override
	public void delete(ReplyDTO replyDTO) throws Exception {
		sqlSession.delete(namespace + ".replyDelete", replyDTO);
		
	}

	
	
	
}
