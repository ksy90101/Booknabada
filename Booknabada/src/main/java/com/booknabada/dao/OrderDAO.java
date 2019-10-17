package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.OrderDTO;
import com.common.dao.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO{
	

	@SuppressWarnings("unchecked")
	public List<OrderDTO> board(int book_no) {
		return selectList("order.booklist", book_no);
	}
	
	
}
