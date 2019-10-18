package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.BookDTO;
import com.booknabada.dto.OrderDTO;
import com.booknabada.dto.StoreDTO;
import com.common.dao.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO{
	

	@SuppressWarnings("unchecked")
	public List<BookDTO> orderBook(int page) {
		return selectList("order.booklist", page);
	}

	@SuppressWarnings("unchecked")
	public List<StoreDTO> storeList(int store) {
		return selectList("order.storelist", store);
	}

	public void orderFinish(OrderDTO dto) {
		insert("order.FinishAction", dto);
	}
	
	
}
