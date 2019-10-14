package com.booknabada.dao;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.LoginDTO;
import com.common.dao.AbstractDAO;

@Repository("loginDAO")
<<<<<<< HEAD
public class LoginDAO extends AbstractDAO{

	public String login(LoginDTO dto) {
		
		return (String) selectOne("login.login", dto);
	}




}
=======
public class LoginDAO extends AbstractDAO {

	public int joinAction(LoginDTO dto) {
		return (int) insert("login.joinAction", dto);
	}


}
>>>>>>> refs/remotes/origin/Yehee2
