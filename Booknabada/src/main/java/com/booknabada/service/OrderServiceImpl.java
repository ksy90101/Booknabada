package com.booknabada.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.OrderDAO;
import com.booknabada.dto.BookDTO;
import com.booknabada.dto.OrderDTO;
import com.booknabada.dto.StoreDTO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="orderDAO")
	private OrderDAO orderDAO;

	@Override
	public List<BookDTO> orderbook(int page) throws Exception {
		return orderDAO.orderBook(page);
	}

	@Override
	public List<StoreDTO> storeList(int store) throws Exception {
		return orderDAO.storeList(store);
	}
	
	//주문값 입력
	@Override
	public void orderFinishAction(OrderDTO dto) throws Exception {
		orderDAO.orderFinish(dto);
	}

	
	

	

	
}
