package com.edu.shopping.service;

import java.util.List;
import java.util.Map;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dto.OrderDTO;
import com.edu.store.dto.ProductDTO;
import com.edu.store.dto.ProductDisplayVO;

public interface ShoppingService {
	// 장바구니에 담긴 product List
	public List<ProductDTO> cartList(MemberDTO member) throws Exception;
	// product detail List
	public List<ProductDisplayVO> cartProductsList(MemberDTO member) throws Exception;
	
	// count change ajax
	public void changeCount(ProductDTO count) throws Exception;

	// 주문 내역 등록하기
	public void orderConfirm(OrderDTO orderDTO) throws Exception;
	// 구매한 물품을 장바구니에서 주문내역으로 변경하기
	public void updateProduct(Map<String, String> productMap) throws Exception;
}
