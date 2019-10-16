package com.booknabada.service;

import com.booknabada.dto.LoginDTO;

public interface MyService {

	// 포인트 가져오기
	int getPoint(String id) throws Exception;

	// 회원정보변경
	LoginDTO detail(int reBno) throws Exception;


}
