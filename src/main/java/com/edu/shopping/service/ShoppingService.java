package com.edu.shopping.service;

import java.util.List;

import com.edu.store.dto.ProductDisplayVO;

public interface ShoppingService {
	// 장바구니에 담긴 product List
	public List<ProductDisplayVO> cartProductsList(String productList) throws Exception;
	// 상품 원가 가져오기
	public int productPrice(ProductDisplayVO productDisplayVO) throws Exception;
}
