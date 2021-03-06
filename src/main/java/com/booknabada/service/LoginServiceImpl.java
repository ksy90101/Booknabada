package com.booknabada.service;

import java.util.Map;

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
	public int checkID(String id) throws Exception {
		return loginDAO.checkID(id);
	}

	@Override
	public String finidAction(LoginDTO dto) throws Exception {
		return loginDAO.findidAction(dto);
	}

	@Override
	public LoginDTO login(Map<String, Object> map) throws Exception {
		return loginDAO.login(map);
	}


}

