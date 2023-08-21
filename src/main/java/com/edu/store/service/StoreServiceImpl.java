package com.edu.store.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.product.dto.ProductDisplayVO;
import com.edu.store.dao.StoreDAO;


@Service("shoppingService")
public class StoreServiceImpl implements StoreService {
	private static final Logger log = LoggerFactory.getLogger(StoreServiceImpl.class);
	
	@Autowired
	private StoreDAO storeDAO;
	
	@Override
	public List<ProductDisplayVO> cartProductsList(int cartNumber) throws Exception {
		// TODO Auto-generated method stub
		return storeDAO.cartProductsList(cartNumber);
	}
}
