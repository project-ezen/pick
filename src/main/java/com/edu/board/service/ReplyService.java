package com.edu.board.service;


import java.util.List;

import com.edu.board.dto.ReplyDTO;

public interface ReplyService {
	
	// 댓글 조회
	public List<ReplyDTO> list(int board_id) throws Exception;

	// 댓글 작성
	public void write(ReplyDTO replyDTO) throws Exception;

	// 댓글 삭제
	public void delete(ReplyDTO replyDTO) throws Exception;

	
}
