package com.booknabada.service;

import com.booknabada.dto.LoginDTO;

public interface LoginService {

	// 로그인 시 user_name 가져오기
	String login(LoginDTO dto) throws Exception;

	// 로그인 시 user_level 가져오기
	int level(String id) throws Exception;
	
	// 로그인 시 user_no 가져오기
	int user_no(LoginDTO dto) throws Exception;

	// 로그인
	int joinAction(LoginDTO dto) throws Exception;

	// ID 중복 확인
	int checkID(String id) throws Exception;

	// ID 찾기
	String finidAction(LoginDTO dto) throws Exception;

	
}