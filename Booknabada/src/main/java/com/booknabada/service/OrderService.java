package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.OrderDTO;

public interface OrderService {

	//디테일 번호 가져오기
	List<OrderDTO> detail(int reBno) throws Exception;


}
