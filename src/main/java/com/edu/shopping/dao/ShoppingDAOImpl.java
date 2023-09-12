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
import com.edu.shopping.dto.OrderSearch;
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

	@Override
	public void overwriteOrder(Map<String, String> map) throws DataAccessException {
		sqlsession.update(namespace + ".cancelProgress", map);
	}

	@Override
	public OrderDTO changeProduct(String order_id) throws DataAccessException {
		return sqlsession.selectOne(namespace + ".changeProduct", order_id);
	}

	@Override
	public void completeOrder(Map<String, String> completeMap) throws DataAccessException {
		sqlsession.update(namespace + ".completeOrder", completeMap);
	}
//=====================================================================================================
	@Override
	public int orderListTotalCount(OrderSearch search) throws DataAccessException {
		return sqlsession.selectOne(namespace + ".orderTotalCount", search);
	}

	@Override
	public List<OrderDTO> showOrder(Map searchMap) throws DataAccessException {
		return sqlsession.selectList(namespace + ".showOrder", searchMap);
	}
	@Override
	public int cancelListTotalCount(OrderSearch search) throws DataAccessException {
		return sqlsession.selectOne(namespace + ".cancelTotalCount", search);
	}

	@Override
	public List<OrderDTO> showCancel(Map searchMap) throws DataAccessException {
		return sqlsession.selectList(namespace + ".showCancel", searchMap);
	}
//=====================================================================================================
	@Override
	public List<OrderDTO> orderNumInfo(int order_num) throws DataAccessException {
		return sqlsession.selectList(namespace + ".orderNumInfo", order_num);
	}
}
