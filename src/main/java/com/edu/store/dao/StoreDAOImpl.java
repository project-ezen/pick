package com.edu.store.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.edu.product.dto.ProductDisplayVO;

@Repository("storeDAO")
public class StoreDAOImpl implements StoreDAO {
	
		private static final Logger log = LoggerFactory.getLogger(StoreDAOImpl.class);
		private static final String namespace = "store.mapper";
		
		@Autowired
		private SqlSession sqlsession;
		
		@Override
		public List<ProductDisplayVO> cartProductsList(int cartNumber) throws DataAccessException {
			// TODO Auto-generated method stub
			return sqlsession.selectList(namespace + ".cartList", cartNumber);
		}
	
}
