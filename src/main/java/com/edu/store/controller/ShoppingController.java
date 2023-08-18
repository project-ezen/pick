package com.edu.store.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/shopping")
public class ShoppingController {
	private static final Logger logger = LoggerFactory.getLogger(ShoppingController.class);
	
	// 장바구니 연결 Controller
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public ModelAndView shoppingCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "./shopping/cart";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}	// End - shoppingCart method
	
	// 주문하기 연결 Controller
	@RequestMapping(value="/order", method=RequestMethod.GET)
	public ModelAndView shoppingOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "./shopping/order";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}	// End shoppingOrder method
}