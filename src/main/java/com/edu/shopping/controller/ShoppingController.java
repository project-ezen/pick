package com.edu.shopping.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.shopping.dto.CartDTO;
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
		String viewName = "./shopping/cart";
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
	
//	// 상품 원가 가져오기
//	@ResponseBody
//	@RequestMapping(value="/calculate", method=RequestMethod.GET)
//	public int productPrice(ProductDisplayVO productDisplayVO) throws Exception {
//		log.info("원가");
//		System.out.println(productDisplayVO);
//		int price = shoppingService.productPrice(productDisplayVO);
//		log.info("제품의 원가는 " + price);
//		
//		// return price;
//		return price;
//	}
	
	// Order Controller
	@RequestMapping(value="/order", method=RequestMethod.GET)
	public ModelAndView shoppingOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/shopping/order";
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}	// End shoppingOrder method
}