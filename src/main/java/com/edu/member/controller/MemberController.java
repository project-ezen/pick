package com.edu.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.bytecode.analysis.MultiArrayType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.member.dto.MemberDTO;
import com.edu.member.service.MemberService;

@Controller					// 컨트롤러를 빈으로 등록한다.
@RequestMapping("/member")	// 공통으로 처리할 URL 매핑.
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//-----------------------------------------------------------------------------------------------------------
	// 컨트롤러는 서비스를 호출하고, 서비스는 DAO를 호출하고, DAO는 SqlSession을 호출한다.
	//-----------------------------------------------------------------------------------------------------------
	@Inject
	@Autowired
	private MemberService memberService;
	
	
	//로그인 화면 get
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String getLogin(@RequestParam(value="action", required=false) String action, 
			HttpServletRequest request,	HttpServletResponse response) throws Exception {
		
		// action 값을 가지고 Session을 설정한다.
		System.out.println("Login GET action : " + action);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		
		
		return "/member/login";
	}
	
	//로그인 => 있는지 확인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberDTO member,
			RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		// 로그인 한 회원정보가 있는지 검사한다.
		MemberDTO memberDTO = memberService.login(member);
		logger.info("memberDTO : " + memberDTO);
		
		// 세션을 사용할 준비를 한다.
		HttpSession session = request.getSession();
		//
		if(memberDTO != null) {	// 아이디와 비밀번호에 맞는 회원정보를 찾아왔으면
			// 세션을 발급한다.
			session.setAttribute("member", memberDTO);
			session.setAttribute("isLogOn", true);
			
			String action = (String)session.getAttribute("action");
			
			System.out.println("Login action : " + action);
			
			session.removeAttribute("action");
			
			if(action != null) {
				mav.setViewName("redirect:" + action);
			} else {
				mav.setViewName("redirect:/");
			}
			
		} else {	// 아이디와 비밀번호에 해당하는 정보가 없으면
			session.setAttribute("member", null);
			rAttr.addFlashAttribute("msg",  false);
			mav.setViewName("redirect:/member/login");
		}
		
		return mav;
		
	}
	
	
	//회원가입 화면 get
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String getJoin() throws Exception {
		logger.info("회원 가입 화면 GET");
		return "/member/join";
	}
	
	
	//회원가입 
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(MemberDTO memberDTO, HttpServletRequest request,	HttpServletResponse response) throws Exception {
		
		// 아이디(이메일)이 존재하는지 먼저 검사한다.
		int result = memberService.idCheck(memberDTO);
		try {
			
			if(result == 1) {
				
				return "/member/join";
				
			} else if(result == 0) {
				memberService.join(memberDTO);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		return "redirect:/mypage";
		
	}
	
	//아이디 중복 검사
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public int idCheck(MemberDTO memberDTO) throws Exception {
		
		int result = memberService.idCheck(memberDTO);
		
		// result 값 : 1이면 아이디에 해당하는 정보가 이미 존재
		//			   0이면 아이디에 해당하는 정보가 존재하지 않는다.
		return result;
	}
	
	//닉네임 중복 검사
	@ResponseBody
	@RequestMapping(value="/nickCheck", method=RequestMethod.POST)
	public int nickCheck(MemberDTO memberDTO) throws Exception {
		
		int result = memberService.nickCheck(memberDTO);

		// result 값 : 1이면 닉네임에 해당하는 정보가 이미 존재
		//			   0이면 닉네임에 해당하는 정보가 존재하지 않는다.
		return result;
	}	
	
	
	
	//아이디 찾기 post
	
	
	//비밀번호 찾기 post
	
	
	//회원정보상세정보 => GET
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public void detail(HttpServletRequest request) throws Exception {
		
		
		
		HttpSession session = request.getSession(); 
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		String id = member.getM_id();
		MemberDTO memberDTO = memberService.detail(id);
			
		System.out.println("상세 정보 :" + memberDTO);
	}
	
	
	//회원정보수정 POST
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(MemberDTO memberDTO) throws Exception {
		
		//client에서 보내오는 데이터들의 name이 맞으면 memberDTO에 알아서 값이 들어간다.
		memberService.edit(memberDTO);
		
		return "redirect:/member/mypage"; 
		//redirect<요청을 해서 데이터도 같이 보여준다.> 
		//redirect없이 쓰면 페이지형태만 보여준다.(/member/memberList로 넘어가지 않는다.)
	}
	
	
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		// 로그아웃 버튼을 눌렀을 경우에는 세션을 없앤다.
		session.invalidate();

		return "redirect:/member/login";
	}	
	

	//아이디 찾기 post
	
	
	//비밀번호 찾기 post
	
	
	
	//====================================================================================================
	//마이페이지에 나오는 부분들
	//my page화면 get
		@RequestMapping(value="/mypage", method=RequestMethod.GET)
		public ModelAndView mypage() throws Exception {
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/member/mypage");
			logger.info("아이디내놔");
			
			return mav;
		}
	
	// 내가쓴 게시물 get 
	//@RequestMapping(value="/myboard", method=RequestMethod.GET)
	//public String myboard(HttpSession session, Model model) throws Exception {
		
		//String id = (String)session.getAttribute("isLogOn");
		
		
		//MemberDTO userinfo = memberService.myboard(id);
		//model.addAttribute("myInfo",userinfo);
		
		//return "member/myboard";
	//}
	
}
