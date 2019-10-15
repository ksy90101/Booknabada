package com.booknabada.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.OrderDAO;
import com.booknabada.dto.OrderDTO;
import com.booknabada.dto.QnaDTO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="orderDAO")
	private OrderDAO orderDAO;

	@Override
	public List<OrderDTO> orderbook(int page) throws Exception {
		return orderDAO.board(page);
	}

	
	

	

	
}
