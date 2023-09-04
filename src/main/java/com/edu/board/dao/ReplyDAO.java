package com.edu.board.dao;

import java.util.List;

import com.edu.board.dto.ReplyDTO;

public interface ReplyDAO {

		// 댓글 조회
		public List<ReplyDTO> list(int board_id) throws Exception;

		// 댓글 조회
		public void write(ReplyDTO replyDTO) throws Exception;

		// 댓글 수정
		public void update(ReplyDTO replyDTO) throws Exception;

		// 댓글 삭제
		public void delete(ReplyDTO replyDTO) throws Exception;

	
}
