package com.edu.member.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.edu.member.dto.MemberDTO;

@Controller
@RequestMapping("/member")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	
	//mypage화면 get
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage(MemberDTO memberDTO) {
		
		logger.info("아이디내놔");
		return "member/mypage"; 
	}
	
	
	
}
