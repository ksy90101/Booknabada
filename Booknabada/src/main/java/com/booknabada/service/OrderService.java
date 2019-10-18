package com.booknabada.service;

import java.util.List;
import java.util.Map;

import com.booknabada.dto.BookDTO;
import com.booknabada.dto.OrderDTO;
import com.booknabada.dto.StoreDTO;

public interface OrderService {

	List<BookDTO> orderbook(int book_no) throws Exception;

	List<StoreDTO> storeList(int store) throws Exception;

	void orderFinishAction(OrderDTO dto) throws Exception;



}
