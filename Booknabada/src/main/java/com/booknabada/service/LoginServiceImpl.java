package com.booknabada.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.LoginDAO;
import com.booknabada.dto.LoginDTO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "loginDAO")
	private LoginDAO loginDAO;

	@Override
	public int joinAction(LoginDTO dto) throws Exception {
		return loginDAO.joinAction(dto);
	}
	
	@Override
	public String login(LoginDTO dto) throws Exception {
		
		return loginDAO.login(dto);
	}

}

