package com.edu.board.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.board.dao.ReplyDAOImpl;
import com.edu.board.dto.ReplyDTO;
import com.edu.board.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Inject
	private ReplyService replyService;
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	//
	/*@RequestMapping(value="/replyList" , method = {RequestMethod.POST, RequestMethod.GET})	
	public ModelAndView replyList(@RequestParam("board_id")int board_id,ModelAndView mav,HttpServletRequest request, HttpServletResponse response) throws Exception { 
		
		List<ReplyDTO> reply =replyService.list(board_id);
		
		mav.setViewName("board/recipedetail");
		
		mav.addObject("reply",reply);

		return mav;
		
	}*/
	
	// 댓글 작성
	@RequestMapping(value = "/rwrite", method = RequestMethod.POST)
	public String replyWirte(ReplyDTO replyDTO) throws Exception {
	    
	    replyService.write(replyDTO);
	    
	    logger.info("replyDTO");
	    
	    return "redirect:/board/recipedetail?board_id="+replyDTO.getB_id();
	    
	}
	
	//댓글 수정
	@RequestMapping(value="/rupdate",method=RequestMethod.POST)
	public String replyUpdate(ReplyDTO replyDTO) throws Exception {
		
		replyService.update(replyDTO);
		
		return "redirect:/board/recipedetail?board_id="+replyDTO.getB_id();
	}
	
	
	
	//댓글 삭제
	@RequestMapping(value="/rdelete",method=RequestMethod.POST)
	public void replyDeletePOST(ReplyDTO replyDTO) throws Exception {
		replyService.delete(replyDTO);
	}
	
	
	
}
