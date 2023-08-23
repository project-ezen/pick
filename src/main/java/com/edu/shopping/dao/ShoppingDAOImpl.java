package com.edu.shopping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.edu.shopping.dto.CartDTO;
import com.edu.store.dto.ProductDisplayVO;

@Repository("shoppingDAO")
public class ShoppingDAOImpl implements ShoppingDAO {
	private static final Logger log = LoggerFactory.getLogger(ShoppingDAOImpl.class);
	private static final String namespace = "shopping.mapper";
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<ProductDisplayVO> cartProductsList(int cartNumber) throws DataAccessException {
		return sqlsession.selectList(namespace + ".cartList", cartNumber);
	}

	@Override
	public int productPrice(ProductDisplayVO productDisplayVO) throws DataAccessException {
		return sqlsession.selectOne(namespace + ".productPrice", productDisplayVO);
	}
}
