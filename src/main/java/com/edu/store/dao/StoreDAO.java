package com.edu.store.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.edu.product.dto.ProductDisplayVO;


public interface StoreDAO {
	
	// 장바구니에 담긴 List 보여주기
		public List<ProductDisplayVO> cartProductsList(int cartNumber) throws DataAccessException;
	}


