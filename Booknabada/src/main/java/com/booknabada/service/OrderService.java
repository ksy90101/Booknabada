package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.OrderDTO;

public interface OrderService {

	List<OrderDTO> orderbook(int page) throws Exception;


}
