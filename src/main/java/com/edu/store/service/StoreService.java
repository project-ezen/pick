package com.edu.store.service;

import java.util.List;

import com.edu.product.dto.ProductDisplayVO;

public interface StoreService {
	// ��ٱ��Ͽ� ��� List �����ֱ�
	public List<ProductDisplayVO> cartProductsList(int cartNumber) throws Exception;
}
