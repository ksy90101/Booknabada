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
	public List<BookDTO> orderBook(int book_no) {
		return selectList("order.booklist", book_no);
	}

	@SuppressWarnings("unchecked")
	public List<StoreDTO> storeList(int store) {
		return selectList("order.storelist", store);
	}

	public void orderFinish(OrderDTO dto) {
		insert("order.FinishAction", dto);
	}
	
	
}
