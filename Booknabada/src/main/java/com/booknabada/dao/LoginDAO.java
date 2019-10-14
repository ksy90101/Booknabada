package com.booknabada.dao;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.LoginDTO;
import com.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{

	public String login(LoginDTO dto) {
		
		return (String) selectOne("login.login", dto);
	}




}
