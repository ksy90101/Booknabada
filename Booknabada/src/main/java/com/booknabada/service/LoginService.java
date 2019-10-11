package com.booknabada.service;

import com.booknabada.dto.LoginDTO;

public interface LoginService {

	int joinAction(LoginDTO dto) throws Exception;
	
}