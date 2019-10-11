package com.booknabada.dao;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.LoginDTO;
import com.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {

	public int joinAction(LoginDTO dto) {
		return (int) insert("login.joinAction", dto);
	}


}