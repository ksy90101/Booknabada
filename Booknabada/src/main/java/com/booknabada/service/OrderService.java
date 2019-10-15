package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.OrderDTO;
import com.booknabada.dto.QnaDTO;

public interface OrderService {

	List<OrderDTO> orderbook(int page) throws Exception;


}
