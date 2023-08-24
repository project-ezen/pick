package com.edu.shopping.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.edu.store.dto.ProductDisplayVO;

public interface ShoppingDAO {
	// 장바구니에 담긴 product List
	public List<ProductDisplayVO> cartProductsList(String productList) throws DataAccessException;
	// 상품 원가 가져오기
	public int productPrice(ProductDisplayVO productDisplayVO) throws DataAccessException;
}
