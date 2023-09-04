package com.edu.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.board.dto.ReplyDTO;
import com.edu.board.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Inject
	private ReplyService replyService;
	
	//
	/*@RequestMapping(value="/replyList" , method = {RequestMethod.POST, RequestMethod.GET})	
	public ModelAndView replyList(@RequestParam("board_id")int board_id,ModelAndView mav,HttpServletRequest request, HttpServletResponse response) throws Exception { 
		
		List<ReplyDTO> reply =replyService.list(board_id);
		
		mav.setViewName("board/recipedetail");
		
		mav.addObject("reply",reply);

		return mav;
		
	}*/
	
	// 댓글 작성
	@RequestMapping(value = "/replywrite", method = RequestMethod.POST)
	public String replyWirte(ReplyDTO replyDTO) throws Exception {
	    
	    replyService.write(replyDTO);
	    
	    return "redirect:/board/recipedetail?board_id"+replyDTO.getBoard_id();
	    
	}
	
}
