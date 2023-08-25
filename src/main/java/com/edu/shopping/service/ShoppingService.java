package com.edu.shopping.service;

import java.util.List;

import com.edu.shopping.dto.CartDTO;
import com.edu.store.dto.ProductDisplayVO;

public interface ShoppingService {
	// 회원 아이디 가져오기
	
	// 해당 회원 아이디가 가진 장바구니 가져오기
	public CartDTO cartList(String memberId) throws Exception;
	// 장바구니에 담긴 product List
	public List<ProductDisplayVO> cartProductsList(CartDTO productList) throws Exception;
}
