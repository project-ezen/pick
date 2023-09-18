package com.edu.shopping.controller;

import java.sql.Date;
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
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dto.CartDTO;
import com.edu.shopping.dto.DisplayOrderVO;
import com.edu.shopping.dto.OrderDTO;
import com.edu.shopping.dto.OrderPaging;
import com.edu.shopping.dto.OrderSearch;
import com.edu.shopping.service.ShoppingService;
import com.edu.store.dto.ProductDTO;

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
	@RequestMapping(value="/order", method = { RequestMethod.GET, RequestMethod.POST })
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
		// 주문 번호 부여하기
		int order_num = getOrderNum(member.getM_id());
		
		log.info("order_number : " + order_num);
		log.info("displayOrderVO : " + displayOrder);
		log.info("total_price : " + total_price);
		
		mav.addObject("order_number", order_num);
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
		
		orderDTO.setM_id(member.getM_id());
		// orderDTO.setOrder_number(order_num);
		orderDTO.setOrder_status("delivery-progressing");
		log.info("orderDTO : " + orderDTO);

		// 구매한 물품을 장바구니에서 주문내역으로 이동하기
		for(int i = 0; i < product.length; i++) {
			// 무작위 8자리 주문 아이디 부여하기
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
	public ModelAndView myOrderList(HttpServletRequest request, HttpServletResponse response, OrderSearch search) throws Exception {
		String viewName = "/shopping/myOrderList";
		ModelAndView mav = new ModelAndView(viewName);
		
		// 세션 준비하기
		HttpSession session = request.getSession();
		// 회원 정보 가져오기
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		// 회원이 주문한 주문 정보 가져오기
		List<OrderDTO> order = shoppingService.orderInfo(member);
		log.info("order_list : " + order);
		
		// 주문한 상품 목록 가져오기 - 주문번호 한 개에 담겨있는 상품 목록 List에 저장
		List<ProductDTO> product = new ArrayList<ProductDTO>();
		for(int i = 0; i < order.size(); i++) {
			product.add(shoppingService.orderList(order.get(i)));
		}
		log.info("product : " + product);
		
		OrderPaging orderPage = new OrderPaging();
		OrderPaging cancelPage = new OrderPaging();
		
		orderPage.setCri(search);
		// cri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
		orderPage.setTotalCount(shoppingService.orderListTotalCount(search));
		log.info("게시물의 총 건수 : " + orderPage.getTotalCount());
		
		cancelPage.setCri(search);
		// cri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
		cancelPage.setTotalCount(shoppingService.cancelListTotalCount(search));
		log.info("게시물의 총 건수 : " + cancelPage.getTotalCount());
		
		mav.addObject("orderPage", orderPage);
		mav.addObject("cancelPage", cancelPage);
		mav.addObject("order", order);
		mav.addObject("product", product);
		return mav;
	}
//----------------------------------------------------------------------------------------------------------------
	// 페이징
	@ResponseBody
	@RequestMapping(value="/paging", method=RequestMethod.GET)
	public ModelAndView pagingList(@RequestParam(value="page", required=false, defaultValue="1") int page, @RequestParam("relation") String rel, OrderSearch search, HttpServletRequest request) throws Exception {
		log.info(page + " 페이지, " + search.getStartDate() + "부터 " + search.getEndDate() + "까지 주문 정보");
		ModelAndView mav = new ModelAndView("jsonView");
		
		// 세션 준비하기
		HttpSession session = request.getSession();
		// 회원 정보 가져오기
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		OrderPaging paging = new OrderPaging();
		
		// 지정한 기간에 주문한 주문 정보 가져오기
		Map searchMap = new HashMap();
		searchMap.put("member", member.getM_id());
		searchMap.put("startDate", search.getStartDate());
		searchMap.put("endDate", search.getEndDate());
		searchMap.put("page", search.getPage());
		searchMap.put("perPageNum", search.getPerPageNum());
		
		// 주문 or 취소 목록
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		if(rel.equals("order")) {
			paging.setCri(search);
			// cri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
			paging.setTotalCount(shoppingService.orderListTotalCount(search));
			log.info("게시물의 총 건수 : " + paging.getTotalCount());
			
			list = shoppingService.showOrder(searchMap);
			log.info("order_list : " + list);
			
		}
		else if(rel.equals("cancel")) {
			paging.setCri(search);
			// cri를 가지고 검색한 총 건수를 TotalCount 변수에 저장한다.
			paging.setTotalCount(shoppingService.cancelListTotalCount(search));
			log.info("게시물의 총 건수 : " + paging.getTotalCount());
			
			list = shoppingService.showCancel(searchMap);
			log.info("order_list : " + list);
		}
		
		// 주문한 상품 목록 가져오기 - 주문번호 한 개에 담겨있는 상품 목록 List에 저장
		List<ProductDTO> product = new ArrayList<ProductDTO>();
		for(int i = 0; i < list.size(); i++) {
			product.add(shoppingService.orderList(list.get(i)));
		}
		log.info("product : " + product);
		log.info("page : " + paging);
		
		if(rel.equals("order")) {
			mav.addObject("orderPage", paging);
			mav.addObject("order", list);
		}
		else if(rel.equals("cancel")) {
			mav.addObject("cancelPage", paging);
			mav.addObject("cancel", list);
		}
		mav.addObject("product", product);
		return mav;
	}
//----------------------------------------------------------------------------------------------------------------
	// 배송 완료
	@ResponseBody
	@RequestMapping(value="/orderComplete", method=RequestMethod.GET)
	public String orderComplete(@RequestParam("id")String id, HttpServletRequest request) throws Exception {
		
		Map<String, String> completeMap = new HashMap<String, String>();
		completeMap.put("id", id);
		completeMap.put("status", "delivery-successed");
		
		shoppingService.completeOrder(completeMap);
		
		return "redirect:/shopping/myOrderList";
	}
//----------------------------------------------------------------------------------------------------------------
	// 상품 취소, 교환, 환불
	@ResponseBody
	@RequestMapping(value="/reason", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String cancelReason(@RequestParam("id")String id, @RequestParam("reason")String c_reason, @RequestParam("title")String title, HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String order_status = new String();
		if(title.equals("Cancel Progressing")) {
			log.info(id + " 주문의 취소 이유는 : " + c_reason);
			order_status = "delivery-refuse(cancel)";
		} else if(title.equals("Refund Progressing")) {
			log.info(id + " 주문의 환불 이유는 : " + c_reason);
			order_status = "product refund";
		} else if(title.equals("Change Progressing")) {
			log.info(id + " 주문의 교환 이유는 : " + c_reason);
			order_status = "product change";
			
			// 같은 물품으로 새 제품 배송 진행
			OrderDTO ordertemp = shoppingService.changeProduct(id);

			// 주문 번호 부여하기
			int order_num = getOrderNum(member.getM_id());
			// 무작위 8자리 주문 아이디 부여하기
			String order_id = getOrderId();
			ordertemp.setOrder_number(order_num);
			ordertemp.setOrder_id(order_id);
			ordertemp.setOrder_status("delivery-progressing");
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("reason", c_reason);
		map.put("status", order_status);
		shoppingService.overwriteOrder(map);
		
		return "redirect:/shopping/myOrderList";
	}
//----------------------------------------------------------------------------------------------------------------
	// myOrderListDetail Controller
	@RequestMapping(value="/myOrderListDetail", method=RequestMethod.GET)
	public ModelAndView myOrderListDetail(@RequestParam("order_number") int order_num, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/shopping/myOrderListDetail";
		ModelAndView mav = new ModelAndView(viewName);
		
		// 세션 준비하기
		HttpSession session = request.getSession();
		// 회원 정보 가져오기
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		// 주문 번호에 해당하는 주문 상세 정보 가져오기
		List<OrderDTO> order = shoppingService.orderNumInfo(order_num);
		
		// 주문한 상품 목록 가져오기 - 주문번호 한 개에 담겨있는 상품 목록 List에 저장
		List<ProductDTO> product = new ArrayList<ProductDTO>();
		for(int i = 0; i < order.size(); i++) {
			product.add(shoppingService.orderList(order.get(i)));
		}
		log.info("product : " + product);
		
		mav.addObject("order", order);
		mav.addObject("product", product);
		mav.addObject("member", member);
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
