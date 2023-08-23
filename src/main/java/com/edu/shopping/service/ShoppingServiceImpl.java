package com.edu.shopping.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.shopping.dao.ShoppingDAO;
import com.edu.store.dto.ProductDisplayVO;

@Service("shoppingService")
public class ShoppingServiceImpl implements ShoppingService {
	private static final Logger log = LoggerFactory.getLogger(ShoppingServiceImpl.class);
	
	@Autowired
	private ShoppingDAO shoppingDAO;
	
	@Override
	public List<ProductDisplayVO> cartProductsList(int cartNumber) throws Exception {
		return shoppingDAO.cartProductsList(cartNumber);
	}

	@Override
	public int productPrice(ProductDisplayVO productDisplayVO) throws Exception {
		return shoppingDAO.productPrice(productDisplayVO);
	}
}
