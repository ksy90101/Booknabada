package com.booknabada.dao;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.LoginDTO;
import com.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {

	public int joinAction(LoginDTO dto) {
		return (int) insert("login.joinAction", dto);
	}

	public String login(LoginDTO dto) {
		
		return (String) selectOne("login.login", dto);
	}

	public int level(String id) {
		return (int) selectOne("login.level", id);
	}

	public int user_no(LoginDTO dto) {
		return (int) selectOne("login.user_no", dto);
	}

	public int checkID(String id) {
		return (int) selectOne("login.checkID", id);
	}

	public String findidAction(LoginDTO dto) {
		return (String) selectOne("login.findidAction", dto);
	}
	

}

