package com.edu.shopping.service;

import java.util.List;
import java.util.Map;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dto.CartDTO;
import com.edu.shopping.dto.OrderDTO;
import com.edu.shopping.dto.OrderSearch;
import com.edu.store.dto.ProductDTO;

public interface ShoppingService {
	// 장바구니에 담긴 product List
	public List<CartDTO> cartList(MemberDTO member) throws Exception;
	// product detail List
	public List<ProductDTO> cartProductsList(MemberDTO member) throws Exception;
	
	// count change ajax
	public void changeCount(CartDTO count) throws Exception;
	
	// 선택한 물품 장바구니에서 삭제하기
	public void deleteCartList(String cart_id) throws Exception;
//=====================================================================================================
	// 상품 id 가져오기
	public int searchProductId(String product_name) throws Exception;
	// 구매한 물품을 장바구니에서 주문내역으로 변경하기
	public void orderConfirm(OrderDTO orderDTO) throws Exception;
	public void deleteProduct(String cart_id) throws Exception;
	// 주문 번호 검사하기
	public List<String> checkOrderNum(String m_id) throws Exception;
	// 주문 아이디 검사하기
	public List<String> checkOrderId() throws Exception;
//=====================================================================================================
	// 회원이 주문한 주문 정보 가져오기
	public List<OrderDTO> orderInfo(MemberDTO member) throws Exception;
	// 주문한 상품 목록 가져오기
	public ProductDTO orderList(OrderDTO order) throws Exception;
	// 주문 상품 취소하기
	public void overwriteOrder(Map<String, String> map) throws Exception;
	// 교환 상품 불러오기
	public OrderDTO changeProduct(String order_id) throws Exception;
	// 교환 상품 재배송하기
	public void reDeliveryProduct(OrderDTO ordertemp) throws Exception;
	// 상품 배송완료
	public void completeOrder(Map<String, String> completeMap) throws Exception;
//=====================================================================================================
	// 페이징
	// 총 주문량
	public int orderListTotalCount(Map searchMap) throws Exception;
	// 지정한 기간에 주문한 주문 정보 가져오기
	public List<OrderDTO> showOrder(Map searchMap) throws Exception;
	// 총 쥐소량
	public int cancelListTotalCount(Map searchMap) throws Exception;
	// 지정한 기간에 쥐소한 주문 정보 가져오기
	public List<OrderDTO> showCancel(Map searchMap) throws Exception;
//=====================================================================================================
	// 주문 번호에 해당하는 주문 상세 정보 가져오기
	public List<OrderDTO> orderNumInfo(int order_num) throws Exception;
}
