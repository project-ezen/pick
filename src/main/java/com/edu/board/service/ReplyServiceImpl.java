package com.edu.board.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.board.dao.ReplyDAO;
import com.edu.board.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	@Autowired
	private ReplyDAO replyDAO;
	private static final Logger logger = LoggerFactory.getLogger(ReplyServiceImpl.class);
	
	
	// 댓글 조회
	@Override
	public List<ReplyDTO> list(int board_id) throws Exception {
		logger.info("댓글내놔");
		return replyDAO.list(board_id);
	}
	// 댓글 입력
	@Override
	public void write(ReplyDTO replyDTO) throws Exception {
		logger.info("쓴거 내놔");
		replyDAO.write(replyDTO);
		
	}

	// 댓글 삭제
	@Override
	public void delete(ReplyDTO replyDTO) throws Exception {
		logger.info("삭제되어라");
		replyDAO.delete(replyDTO);
		
	}

	
	
}
