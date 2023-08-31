package com.edu.shopping.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dao.ShoppingDAO;
import com.edu.shopping.dto.OrderDTO;
import com.edu.store.dto.ProductDTO;
import com.edu.store.dto.ProductDisplayVO;

@Service("shoppingService")
public class ShoppingServiceImpl implements ShoppingService {
	private static final Logger log = LoggerFactory.getLogger(ShoppingServiceImpl.class);
	
	@Autowired
	private ShoppingDAO shoppingDAO;

	@Override
	public List<ProductDTO> cartList(MemberDTO member) throws Exception {
		return shoppingDAO.cartList(member);
	}
	
	@Override
	public List<ProductDisplayVO> cartProductsList(MemberDTO member) throws Exception {
		return shoppingDAO.cartProductsList(member);
	}

	@Override
	public void changeCount(ProductDTO count) throws Exception {
		shoppingDAO.changeCount(count);
	}

	@Override
	public void orderConfirm(OrderDTO orderDTO) throws Exception {
		shoppingDAO.orderConfirm(orderDTO);
	}

	@Override
	public void updateProduct(Map<String, String> productMap) throws Exception {
		shoppingDAO.updateProduct(productMap);
	}

	@Override
	public List<OrderDTO> orderInfo(MemberDTO member) throws Exception {
		return shoppingDAO.orderInfo(member);
	}

	@Override
	public List<ProductDTO> orderList(OrderDTO order) throws Exception {
		return shoppingDAO.orderList(order);
	}

	@Override
	public ProductDisplayVO orderListDetail(ProductDTO product) throws Exception {
		return shoppingDAO.orderListDetail(product);
	}
}
