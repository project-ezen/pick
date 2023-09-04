package com.edu.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.board.dto.ReplyDTO;
import com.edu.board.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Inject
	private ReplyService replyService;
	
	//
	
	
	
	// 댓글 작성
	@RequestMapping(value = "/replywrite", method = RequestMethod.POST)
	public void replyWirte(ReplyDTO replyDTO) throws Exception {
	    
	    replyService.write(replyDTO);
	    
	}
	
}
