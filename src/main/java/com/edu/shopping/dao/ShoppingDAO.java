package com.edu.shopping.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dto.CartDTO;
import com.edu.store.dto.ProductDisplayVO;

public interface ShoppingDAO {
	// 회원 아이디 가져오기
	
	// 해당 회원 아이디가 가진 장바구니 가져오기
	public CartDTO cartList(String memberId) throws DataAccessException;
	
	// 장바구니에 담긴 product List
	public List<ProductDisplayVO> cartProductsList(CartDTO productList) throws DataAccessException;

	// 해당 회원이 가진 주소 및 전화번호 가져오기
	public MemberDTO memberInfo(String member_id) throws DataAccessException;

}
