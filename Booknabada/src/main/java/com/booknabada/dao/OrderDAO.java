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
		return selectList("order.orderBook", book_no);
	}

	@SuppressWarnings("unchecked")
	public List<StoreDTO> storeList(int store) {
		return selectList("order.storelist", store);
	}

	public int getPoint(String id) {
		return (int) selectOne("my.getPoint", id);
	}
	
	public void orderFinish(OrderDTO dto) {
		insert("order.FinishAction", dto);
	}

	public void wishlistAction(OrderDTO dto) {
		insert("order.wishlistAction", dto);
		
	}

	@SuppressWarnings("unchecked")
	public List<BookDTO> wishlistBook(int user_no) {
		return selectList("order.wishlistBook", user_no);
	}


	
}
