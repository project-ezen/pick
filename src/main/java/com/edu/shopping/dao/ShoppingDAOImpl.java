package com.edu.shopping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.edu.member.dto.MemberDTO;
import com.edu.shopping.dto.CartDTO;
import com.edu.shopping.dto.OrderDTO;
import com.edu.store.dto.ProductDTO;

@Repository("shoppingDAO")
public class ShoppingDAOImpl implements ShoppingDAO {
	private static final Logger log = LoggerFactory.getLogger(ShoppingDAOImpl.class);
	private static final String namespace = "shopping.mapper";
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<CartDTO> cartList(MemberDTO member) throws DataAccessException {
		return sqlsession.selectList(namespace + ".cartList", member);
	}
	
	@Override
	public List<ProductDTO> cartProductsList(MemberDTO member) throws DataAccessException {
		return sqlsession.selectList(namespace + ".productList", member);
    }

	@Override
	public void changeCount(CartDTO count) throws DataAccessException {
		sqlsession.update(namespace + ".changeCount", count);
	}
//=====================================================================================================
	@Override
	public int searchProductId(String product_name) throws DataAccessException {
		return sqlsession.selectOne(namespace + ".searchProductId", product_name);
	}
    
	@Override
	public void orderConfirm(OrderDTO orderDTO) throws DataAccessException {
		sqlsession.insert(namespace + ".orderInsert", orderDTO);
	}
	@Override
	public void deleteProduct(String cart_id) throws DataAccessException {
		log.info("cart : " + cart_id);
		sqlsession.delete(namespace + ".deleteProduct", cart_id);
	}

	@Override
	public List<String> checkOrderId() throws DataAccessException {
		return sqlsession.selectList(namespace + ".checkOrderId");
	}
	@Override
	public List<String> checkOrderNum(String m_id) throws DataAccessException {
		return sqlsession.selectList(namespace + ".checkOrderNum", m_id);
	}
//=====================================================================================================
	@Override
	public List<OrderDTO> orderInfo(MemberDTO member) throws DataAccessException {
		return sqlsession.selectList(namespace + ".orderInfo", member);
	}
	
	@Override
	public ProductDTO orderList(OrderDTO order) throws DataAccessException {
		return sqlsession.selectOne(namespace + ".orderList", order);
	}
}
