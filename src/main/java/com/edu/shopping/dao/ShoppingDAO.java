package com.edu.shopping.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dto.OrderDTO;
import com.edu.store.dto.ProductDTO;
import com.edu.store.dto.ProductDisplayVO;

public interface ShoppingDAO {
	// 장바구니에 담긴 product List
	public List<ProductDTO> cartList(MemberDTO member) throws DataAccessException;
	// product detail List
	public List<ProductDisplayVO> cartProductsList(MemberDTO member) throws DataAccessException;
	
	// count change ajax
	public void changeCount(ProductDTO count) throws DataAccessException;

	// 주문 내역 등록하기
	public void orderConfirm(OrderDTO orderDTO) throws DataAccessException;
	// 구매한 물품을 장바구니에서 주문내역으로 변경하기
	public void updateProduct(Map<String, String> productMap) throws DataAccessException;
	
	// 회원이 주문한 주문 정보 가져오기
	public List<OrderDTO> orderInfo(MemberDTO member) throws DataAccessException;
	// 주문한 상품 목록 가져오기
	public List<ProductDTO> orderList(OrderDTO order) throws DataAccessException;
	// 상품 상세 정보
	public ProductDisplayVO orderListDetail(ProductDTO product) throws DataAccessException;
}
