package com.edu.shopping.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dao.ShoppingDAO;
import com.edu.shopping.dto.CartDTO;
import com.edu.shopping.dto.OrderDTO;
import com.edu.store.dto.ProductDisplayVO;

@Service("shoppingService")
public class ShoppingServiceImpl implements ShoppingService {
	private static final Logger log = LoggerFactory.getLogger(ShoppingServiceImpl.class);
	
	@Autowired
	private ShoppingDAO shoppingDAO;

	@Override
	public CartDTO cartList(MemberDTO member) throws Exception {
		return shoppingDAO.cartList(member);
	}
	
	@Override
	public List<ProductDisplayVO> cartProductsList(CartDTO productList) throws Exception {
		return shoppingDAO.cartProductsList(productList);
	}

	@Override
	public void orderConfirm(OrderDTO orderDTO) throws Exception {
		shoppingDAO.orderConfirm(orderDTO);
	}

	@Override
	public void dropProduct(Map<String, String> productMap) throws Exception {
		shoppingDAO.dropProduct(productMap);
	}
}
