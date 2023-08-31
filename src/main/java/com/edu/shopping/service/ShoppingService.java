package com.edu.shopping.service;

import java.util.List;
import java.util.Map;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dto.CartDTO;
import com.edu.shopping.dto.OrderDTO;
import com.edu.store.dto.ProductDTO;
import com.edu.store.dto.ProductDisplayVO;

public interface ShoppingService {
	// 장바구니에 담긴 product List
	public List<CartDTO> cartList(MemberDTO member) throws Exception;
	// product detail List
	public List<ProductDTO> cartProductsList(MemberDTO member) throws Exception;
	
	// count change ajax
	public void changeCount(CartDTO count) throws Exception;

	// 주문 내역 등록하기
	public void orderConfirm(OrderDTO orderDTO) throws Exception;
	// 구매한 물품을 장바구니에서 주문내역으로 변경하기
	public void updateProduct(Map<String, String> productMap) throws Exception;
	
	// 회원이 주문한 주문 정보 가져오기
	public List<OrderDTO> orderInfo(MemberDTO member) throws Exception;
	// 주문한 상품 목록 가져오기
	public List<ProductDTO> orderList(OrderDTO order) throws Exception;
	// 상품 상세 정보
	public ProductDisplayVO orderListDetail(ProductDTO product) throws Exception;
}
