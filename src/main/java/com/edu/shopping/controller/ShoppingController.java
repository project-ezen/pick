package com.edu.shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
import com.edu.shopping.dto.CartDTO;
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
		List<CartDTO> cartList = shoppingService.cartList(member);
		log.info("cartList : " + cartList);
		
		// product detail List
		List<ProductDTO> productList = shoppingService.cartProductsList(member);
		log.info("productDetailList : " + productList);
		
		mav.setViewName(viewName);
		mav.addObject("cart", cartList);
		mav.addObject("product", productList);
		return mav;
	}	// End - shoppingCart method
//----------------------------------------------------------------------------------------------------------------	
	// count change ajax
	@ResponseBody
	@RequestMapping(value="/countchange", method=RequestMethod.GET)
	public void changeCount(@ModelAttribute CartDTO count, HttpServletRequest request) throws Exception {
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
		String cart_id[] = request.getParameterValues("cartId");
		String image[] = request.getParameterValues("imageFile");
		String product_name[] = request.getParameterValues("productName");
		String product_price[] = request.getParameterValues("productPrice");
		String count[] = request.getParameterValues("cnt");
		String total_price = request.getParameter("totalPrice");
		
		List<DisplayOrderVO> displayOrder = new ArrayList<DisplayOrderVO>();
		for(int i = 0; i < count.length; i++) {
			DisplayOrderVO temp = new DisplayOrderVO(cart_id[i], image[i], product_name[i], product_price[i], count[i]);
			
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
		
		// 구매한 물품 정보 가져오기
		String product[] = request.getParameterValues("productName");
		String count[] = request.getParameterValues("productCount");
		
		// 주문 번호 부여하기
		int order_num = getOrderNum(member.getM_id());
		orderDTO.setM_id(member.getM_id());
		orderDTO.setOrder_number(order_num);
		orderDTO.setOrder_status("delivery-progressing");
		log.info("orderDTO : " + orderDTO);

		// 구매한 물품을 장바구니에서 주문내역으로 이동하기
		for(int i = 0; i < product.length; i++) {
			// 무작위 8자리 장바구니 번호 부여하기
			String order_id = getOrderId();
			orderDTO.setOrder_id(order_id);
			
			// 상품 id 가져오기
			int product_id = shoppingService.searchProductId(product[i]);
			orderDTO.setProduct_id(product_id);
			orderDTO.setCount(Integer.parseInt(count[i]));
			System.out.println("orderDTOorderDTOorderDTO ===> " + orderDTO);
			shoppingService.orderConfirm(orderDTO);
		}
		log.info("주문내역 등록 완료");

		// 장바구니 가져오기
		String cart_id[] = request.getParameterValues("cart");
				
		for(int i = 0; i < product.length; i++) {
			shoppingService.deleteProduct(cart_id[i]);
		}
		log.info("장바구니 삭제 완료");
		
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
		
		// 회원이 주문한 주문 정보 가져오기
		List<OrderDTO> order = shoppingService.orderInfo(member);
		log.info("order_list : " + order);
		
		// 주문한 상품 목록 가져오기 - 주문번호 한 개에 담겨있는 상품 목록 2차원 List에 저장
		List<List<ProductDTO>> product = new ArrayList<>();
		for(int i = 0; i < order.size(); i++) {			
			product.add(shoppingService.orderList(order.get(i)));
		}
		log.info("product : " + product);
		
		// 상품 상세 정보
		List<ProductDisplayVO> productInfo = new ArrayList<ProductDisplayVO>();
		for(int i = 0; i < product.size(); i++) {
			for(int j = 0; j < product.get(i).size(); j++) {
				productInfo.add(shoppingService.orderListDetail(product.get(i).get(j)));
			}
		}
		log.info("productInfo : " + productInfo);
		
		mav.addObject("order", order);
		mav.addObject("product", product);
		mav.addObject("productInfo", productInfo);
		return mav;
	}
	
	// myOrderListDetail Controller
	@RequestMapping(value="/myOrderListDetail", method=RequestMethod.GET)
	public ModelAndView myOrderListDetail() throws Exception {
		String viewName = "/shopping/myOrderListDetail";
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
//----------------------------------------------------------------------------------------------------------------	
	// Random String
	static public String getRandomString(int length) {
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
		
		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0".split(",");
		
		for (int i = 0; i < length; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}
		return buffer.toString();
	}
	// get orderId
	public String getOrderId() throws Exception {
		String order = getRandomString(8);
		List<String> check_order = shoppingService.checkOrderId();
		for(int i = 0; i < check_order.size(); i++) {
			if(order == check_order.get(i)) {
				break;
			}
			else {
				order = getRandomString(8);
				break;
			}
		}
		return order;
	}
	// get orderNumber
	public int getOrderNum(String m_id) throws Exception {
		int order = (int)(Math.random() * 10000);
		List<String> check_order = shoppingService.checkOrderNum(m_id);
		for(int i = 0; i < check_order.size(); i++) {
			if(order == Integer.parseInt(check_order.get(i))) {
				break;
			}
			else {
				order = (int)(Math.random() * 10000);
				break;
			}
		}
		return order;
	}
}
