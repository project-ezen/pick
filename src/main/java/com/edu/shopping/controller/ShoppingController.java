package com.edu.shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dto.CartDTO;
import com.edu.shopping.dto.DisplayOrderVO;
import com.edu.shopping.service.ShoppingService;
import com.edu.store.dto.ProductDisplayVO;

@Controller
@RequestMapping(value="/shopping")
public class ShoppingController {
	private static final Logger log = LoggerFactory.getLogger(ShoppingController.class);
	
	@Inject
	ShoppingService shoppingService;
	
	// Cart Controller
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public ModelAndView shoppingCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/shopping/cart";
		ModelAndView mav = new ModelAndView();
		
		// 회원 아이디 가져오기
		String memberId = "101";
		log.info("memberId : " + memberId);
		
		// 해당 회원 아이디가 가진 장바구니
		CartDTO cartList = shoppingService.cartList(memberId);
		log.info("cartList : " + cartList);
		
		// 장바구니에 담긴 product List
		List<ProductDisplayVO> productDetailList = shoppingService.cartProductsList(cartList);
		log.info("productDetailList : " + productDetailList);
		
		log.info("장바구니에 담긴 product List");
		
		mav.setViewName(viewName);
		mav.addObject("cart", cartList);
		mav.addObject("product", productDetailList);
		return mav;
	}	// End - shoppingCart method
	
	// Order Controller
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public ModelAndView shoppingOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/shopping/order";
		ModelAndView mav = new ModelAndView();
		
		// 회원 아이디 가져오기
		String memberId = "101";
		log.info("memberId : " + memberId);
		
		// 해당 회원이 가진 주소 및 전화번호 가져오기
		MemberDTO member = shoppingService.memberInfo(memberId);
		log.info("member : " + member);
		
		// 이전 페이지에서 보낸 데이터 가져오기
		String image[] = request.getParameterValues("imageFile");
		String product_name[] = request.getParameterValues("productName");
		String product_price[] = request.getParameterValues("productPrice");
		String count[] = request.getParameterValues("cnt");
		String total_price = request.getParameter("totalPrice");
		
		List<DisplayOrderVO> displayOrder = new ArrayList<DisplayOrderVO>();
		for(int i = 0; i < count.length; i++) {
			DisplayOrderVO temp = new DisplayOrderVO(image[i], product_name[i], product_price[i], count[i]);
			
			displayOrder.add(temp);
		}
		
		log.info("displayOrderVO : " + displayOrder);
		log.info("total_price : " + total_price);
		
		mav.addObject("member", member);
		mav.addObject("displayOrder", displayOrder);
		mav.addObject("total_price", total_price);
		mav.setViewName(viewName);
		return mav;
	}	// End shoppingOrder method
}
