package com.edu.shopping.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dto.CartDTO;
import com.edu.shopping.dto.OrderDTO;
import com.edu.store.dto.ProductDTO;

public interface ShoppingDAO {
	// 장바구니에 담긴 product List
	public List<CartDTO> cartList(MemberDTO member) throws DataAccessException;
	// product detail List
	public List<ProductDTO> cartProductsList(MemberDTO member) throws DataAccessException;
	
	// count change ajax
	public void changeCount(CartDTO count) throws DataAccessException;
//=====================================================================================================
	// 상품 id 가져오기
	public int searchProductId(String product_name) throws DataAccessException;
	// 구매한 물품을 장바구니에서 주문내역으로 변경하기
	public void orderConfirm(OrderDTO orderDTO) throws DataAccessException;
	public void deleteProduct(String cart_id) throws DataAccessException;
	// 주문 번호 검사하기
	public List<String> checkOrderNum(String m_id) throws DataAccessException;
	// 주문 아이디 검사하기
	public List<String> checkOrderId() throws DataAccessException;
//=====================================================================================================
	// 회원이 주문한 주문 정보 가져오기
	public List<OrderDTO> orderInfo(MemberDTO member) throws DataAccessException;
	// 주문한 상품 목록 가져오기
	public ProductDTO orderList(OrderDTO order) throws DataAccessException;
	// 주문 상품 취소하기
	public void overwriteOrder(Map<String, String> map) throws DataAccessException;
//=====================================================================================================
	// 주문 번호에 해당하는 주문 상세 정보 가져오기
	public List<OrderDTO> orderNumInfo(int order_num) throws DataAccessException;
}
