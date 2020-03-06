package com.booknabada.service;

import java.util.Map;

import com.booknabada.dto.LoginDTO;

public interface LoginService {

	// 로그인 시 정보 가져오기
	LoginDTO login(Map<String, Object> map) throws Exception;

	// 로그인
	int joinAction(LoginDTO dto) throws Exception;

	// ID 중복 확인
	int checkID(String id) throws Exception;

	// ID 찾기
	String finidAction(LoginDTO dto) throws Exception;


	
}