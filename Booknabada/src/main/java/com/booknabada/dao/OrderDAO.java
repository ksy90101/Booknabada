package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.OrderDTO;
import com.common.dao.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO{
	

	@SuppressWarnings("unchecked")
	public List<OrderDTO> orderBook(int page) {
		return selectList("order.booklist", page);
	}

	@SuppressWarnings("unchecked")
	public List<OrderDTO> storeList(int store) {
		return selectList("order.storelist", store);
	}
	
	
}
