package com.edu.store.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.store.controller.StoreController;
import com.edu.store.dao.StoreDAO;
import com.edu.store.dto.ProductDisplayVO;
import com.edu.store.dto.ProductReviewCriteria;
import com.edu.store.dto.ReviewDTO;
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

//--------------------------------------------------------------------------------------------
// 상품 리스트 키워드로 검색하기
//--------------------------------------------------------------------------------------------
public List<ProductDisplayVO> searchProductByKeyword(String searchKeyword, String select) throws Exception {
	List<ProductDisplayVO> productList = storeDAO.searchProductByKeyword(searchKeyword, select);
	return productList;
}

//--------------------------------------------------------------------------------------------
// 상품 리스트 키워드&카테고리
//--------------------------------------------------------------------------------------------
public List<ProductDisplayVO> searchProductByCategoryAndKeyword(String category, String searchKeyword, String select) throws Exception {
	List<ProductDisplayVO> productList = storeDAO.searchProductByCategoryAndKeyword(category, searchKeyword, select);
	return productList;
}


//--------------------------------------------------------------------------------------------
// 상품 상세 보기
//--------------------------------------------------------------------------------------------
public List<ProductDTO> productInfos(String product_id) throws Exception {
	 return storeDAO.productInfos(product_id);
	
}
	
public List<ProductDisplayVO> displayProductInfos(String product_id) throws Exception {
	return storeDAO.displayProductInfos(product_id);
}

public List<ReviewDTO> selectReview(ProductReviewCriteria productreviewcri) throws Exception {
	return storeDAO.selectReview(productreviewcri);	
}

public void productToCart(String product_id, String quantity, String memberId, String cartOrStore, String cartId ) throws Exception {
	
	storeDAO.productToCart(product_id, quantity, memberId, cartOrStore, cartId);

}

//--------------------------------------------------------------------------------------------
// 상품 새리뷰 작성하기 
//--------------------------------------------------------------------------------------------
public int addNewReview(Map reviewMap, String product_id, String member) throws Exception {
	return storeDAO.insertNewReview(reviewMap, product_id, member);
}

//----------------------------------------------------------------------------------------------------------------------------------
// 리뷰 삭제하기
//----------------------------------------------------------------------------------------------------------------------------------
public void reviewRemove(String reviewId) throws Exception{
	storeDAO.reviewRemove(reviewId);
}

//----------------------------------------------------------------------------------------------------------------------------------
// 리뷰 페이징 Ajax (count)
//----------------------------------------------------------------------------------------------------------------------------------
public int productReviewCount(ProductReviewCriteria productreviewcri) throws Exception{	
	return  storeDAO.productReviewCount(productreviewcri);
}





}
