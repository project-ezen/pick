package com.edu.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dto.CartDTO;
import com.edu.shopping.dto.OrderDTO;
import com.edu.store.dto.ProductDisplayVO;

@Repository("shoppingDAO")
public class ShoppingDAOImpl implements ShoppingDAO {
	private static final Logger log = LoggerFactory.getLogger(ShoppingDAOImpl.class);
	private static final String namespace = "shopping.mapper";
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public CartDTO cartList(MemberDTO member) throws DataAccessException {
		return sqlsession.selectOne(namespace + ".cartList", member);
	}
	
	@Override
	public List<ProductDisplayVO> cartProductsList(CartDTO productList) throws DataAccessException {
		log.info("productList" + productList);
		return sqlsession.selectList(namespace + ".productsDetailList", productList);
    }
    
	@Override
	public void orderConfirm(OrderDTO orderDTO) throws DataAccessException {
		sqlsession.insert(namespace + ".orderInsert", orderDTO);
	}

	@Override
	public void dropProduct(Map<String, String> productMap) throws DataAccessException {
		log.info("productMap : " + productMap.toString());
		sqlsession.delete(namespace + ".deleteProduct", productMap);
	}
}
