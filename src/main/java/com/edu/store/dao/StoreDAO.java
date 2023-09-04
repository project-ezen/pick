package com.edu.store.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.edu.store.dto.ProductDisplayVO;
import com.edu.store.dto.ProductDTO;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository("storeDAO")
public class StoreDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreDAO.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	
	private static final String namespace ="com.edu.store.mappers.storeMapper";
	
	//--------------------------------------------------------------------------------------------
	// 상품 리스트
	//--------------------------------------------------------------------------------------------
	public List selectAllProductList(String category, String select) throws DataAccessException {
		logger.info("Received category parameter in DAO: " + category);
		logger.info("6");
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("category", category);
		paramMap.put("select", select);
		List<ProductDisplayVO> productList = sqlSession.selectList(namespace + ".selectAllProductList", paramMap);
		
		return productList;
	}

	public List searchProductByKeyword(String searchKeyword, String select) throws DataAccessException {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("searchKeyword", searchKeyword);
		paramMap.put("select", select);
		List<ProductDisplayVO> productList = sqlSession.selectList(namespace + ".searchProductByKeyword", paramMap);
		
		return productList;
	}
	
	public List<ProductDisplayVO> searchProductByCategoryAndKeyword(String category, String searchKeyword, String select) throws DataAccessException {
	    Map<String, String> paramMap = new HashMap<>();
	    paramMap.put("category", category);
	    paramMap.put("searchKeyword", searchKeyword);
	    paramMap.put("select", select);
	    
	    logger.info("category" + category + "search" + searchKeyword); 
	    
	    List<ProductDisplayVO> productList = sqlSession.selectList(namespace + ".searchProductByCategoryAndKeyword", paramMap);
	    
	    return productList;
	}
	
	//--------------------------------------------------------------------------------------------
	// 상품 상세 보기
	//--------------------------------------------------------------------------------------------
	public List<ProductDisplayVO> productInfos(String product_id) {
		return sqlSession.selectList(namespace + ".productInfos", product_id);
	}
	
	public void productToCart(String product_id, String quantity, String memberId) throws Exception{
		
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("product_id", product_id);
	    paramMap.put("quantity", quantity);
	    paramMap.put("memberId", memberId);
	    
		sqlSession.insert(namespace + ".productToCart", paramMap);
	}
	
}
