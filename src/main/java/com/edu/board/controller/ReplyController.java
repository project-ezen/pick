package com.edu.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.board.dao.ReplyDAOImpl;
import com.edu.board.dto.ReplyDTO;
import com.edu.board.service.ReplyService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Inject
	private ReplyService replyService;
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	// 댓글 작성
	@RequestMapping(value = "/rwrite", method = RequestMethod.POST)
	public String replyWirte(ReplyDTO replyDTO) throws Exception {
	    
	    replyService.write(replyDTO);
	    
	    return "redirect:/board/recipedetail?board_id="+replyDTO.getB_id();
	}
		
	//댓글 삭제
	@RequestMapping(value="/rdelete",method= {RequestMethod.GET,RequestMethod.POST})
	public String replyDeletePOST(ReplyDTO replyDTO) throws Exception {
		
		replyService.delete(replyDTO);
		
		return "redirect:/board/recipedetail?board_id="+replyDTO.getB_id();
	}
	
	
}
