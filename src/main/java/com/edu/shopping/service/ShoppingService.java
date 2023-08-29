package com.edu.shopping.service;

import java.util.List;
import java.util.Map;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dto.CartDTO;
import com.edu.shopping.dto.OrderDTO;
import com.edu.store.dto.ProductDisplayVO;

public interface ShoppingService {
	// 해당 회원이 가진 장바구니 가져오기
	public CartDTO cartList(MemberDTO member) throws Exception;
	// 장바구니에 담긴 product List
	public List<ProductDisplayVO> cartProductsList(CartDTO productList) throws Exception;

	// 주문 내역 등록하기
	public void orderConfirm(OrderDTO orderDTO) throws Exception;
	// 구매한 물품을 장바구니에서 제거하기
	public void dropProduct(Map<String, String> productMap) throws Exception;
}
