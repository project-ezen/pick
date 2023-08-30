package com.edu.shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dto.DisplayOrderVO;
import com.edu.shopping.dto.OrderDTO;
import com.edu.shopping.service.ShoppingService;
import com.edu.store.dto.ProductDTO;
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
		
		// 세션 가져오기
		HttpSession session = request.getSession();
		// 회원 정보 가져오기
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		log.info("memberDTO : " + member);
		
		// 장바구니에 담긴 product List
		List<ProductDTO> cartList = shoppingService.cartList(member);
		log.info("cartList : " + cartList);
		
		// product detail List
		List<ProductDisplayVO> productDetailList = shoppingService.cartProductsList(member);
		log.info("productDetailList : " + productDetailList);
		
		log.info("장바구니에 담긴 product List");
		
		mav.setViewName(viewName);
		mav.addObject("cart", cartList);
		mav.addObject("product", productDetailList);
		return mav;
	}	// End - shoppingCart method
//----------------------------------------------------------------------------------------------------------------	
	// count change ajax
	@ResponseBody
	@RequestMapping(value="/countchange", method=RequestMethod.GET)
	public void changeCount(@ModelAttribute ProductDTO count, HttpServletRequest request) throws Exception {
		log.info("Count change 준비 " + count);
		shoppingService.changeCount(count);
		log.info("Count change 완료");
	}
//----------------------------------------------------------------------------------------------------------------	
	// Order Controller
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public ModelAndView shoppingOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/shopping/order";
		ModelAndView mav = new ModelAndView();
		
		// 세션 가져오기
		HttpSession session = request.getSession();
		// 회원 정보 가져오기
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		log.info("memberDTO : " + member);
		
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
//----------------------------------------------------------------------------------------------------------------	
	// OrderDetail Controller
	@RequestMapping(value="/orderdetail", method=RequestMethod.POST)
	public ModelAndView orderComplete(@ModelAttribute("order")OrderDTO orderDTO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "redirect:/shopping/cart";
		ModelAndView mav = new ModelAndView();
		
		log.info("orderDTO : " + orderDTO);
		// 세션 가져오기
		HttpSession session = request.getSession();
		// 회원 정보 가져오기
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		// 주문 번호 부여하기
		String order_id = "301";
		orderDTO.setM_id(member.getM_id());
		orderDTO.setOrder_id(order_id);
		
		log.info("orderDTO : " + orderDTO);
		
		// 주문 내역 등록하기
		shoppingService.orderConfirm(orderDTO);
		log.info("주문내역 등록 완료");
		
		// 구매한 물품 가져오기
		String product[] = request.getParameterValues("productName");
		
		// 구매한 물품을 장바구니에서 주문내역으로 변경하기
		Map<String, String> productMap = new HashMap<String, String>();
		for(int i = 0; i < product.length; i++) {
			productMap.put("member_id", member.getM_id());
			productMap.put("product_name", product[i]);
			productMap.put("order_id", order_id);
			shoppingService.updateProduct(productMap);
		}
		log.info("장바구니 변경 완료");
		
		mav.setViewName(viewName);
		return mav;
	}	// End orderComplete method
//----------------------------------------------------------------------------------------------------------------	
	// myOrderList Controller
	@RequestMapping(value="/myOrderList", method=RequestMethod.GET)
	public ModelAndView myOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/shopping/myOrderList";
		ModelAndView mav = new ModelAndView(viewName);
		
		// 세션 준비하기
		HttpSession session = request.getSession();
		// 회원 정보 가져오기
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		// 주문 정보 가져오기
		//OrderDTO order = shoppingService.buyProductList(member);
		return mav;
	}
	
	// myOrderListDetail Controller
	@RequestMapping(value="/myOrderListDetail", method=RequestMethod.GET)
	public ModelAndView myOrderListDetail() throws Exception {
		String viewName = "/shopping/myOrderListDetail";
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
}
