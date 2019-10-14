package com.booknabada.service;

import com.booknabada.dto.LoginDTO;

public interface LoginService {

	String login(LoginDTO dto) throws Exception;

	int joinAction(LoginDTO dto) throws Exception;

	int checkID(String id) throws Exception;
	
}