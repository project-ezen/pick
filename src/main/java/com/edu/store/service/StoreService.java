package com.edu.store.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.store.controller.StoreController;
import com.edu.store.dao.StoreDAO;
import com.edu.store.dto.ProductDisplayVO;
import com.edu.store.dto.ProductDTO;




@Service("storeService")
public class StoreService {
	@Autowired
	StoreDAO storeDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(StoreService.class);


	
//--------------------------------------------------------------------------------------------
// 상품 리스트
//--------------------------------------------------------------------------------------------
public List<ProductDisplayVO> listProduct(String category, String select) throws Exception {
	logger.info("------------------------------------------------------------------------------");
	
	List<ProductDisplayVO> productList = storeDAO.selectAllProductList(category, select);
	return productList;
}

public List<ProductDisplayVO> searchProductByKeyword(String searchKeyword, String select) throws Exception {
	List<ProductDisplayVO> productList = storeDAO.searchProductByKeyword(searchKeyword, select);
	return productList;
}

public List<ProductDisplayVO> searchProductByCategoryAndKeyword(String category, String searchKeyword, String select) throws Exception {
	List<ProductDisplayVO> productList = storeDAO.searchProductByCategoryAndKeyword(category, searchKeyword, select);
	return productList;
}

//--------------------------------------------------------------------------------------------
// 상품 상세 보기
//--------------------------------------------------------------------------------------------
public List<ProductDisplayVO> productInfos(String product_id) throws Exception {
	 return storeDAO.productInfos(product_id);
	
}
	
}
