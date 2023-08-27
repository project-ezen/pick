package com.edu.shopping.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dao.ShoppingDAO;
import com.edu.shopping.dto.CartDTO;
import com.edu.store.dto.ProductDisplayVO;

@Service("shoppingService")
public class ShoppingServiceImpl implements ShoppingService {
	private static final Logger log = LoggerFactory.getLogger(ShoppingServiceImpl.class);
	
	@Autowired
	private ShoppingDAO shoppingDAO;

	@Override
	public CartDTO cartList(String memberId) throws Exception {
		return shoppingDAO.cartList(memberId);
	}
	
	@Override
	public List<ProductDisplayVO> cartProductsList(CartDTO productList) throws Exception {
		return shoppingDAO.cartProductsList(productList);
	}

	@Override
	public MemberDTO memberInfo(String member_id) throws Exception {
		return shoppingDAO.memberInfo(member_id);
	}
}
