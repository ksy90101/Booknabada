package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.BookDTO;
import com.booknabada.dto.LoginDTO;
import com.common.dao.AbstractDAO;

@Repository("mailDAO")
public class MailDAO extends AbstractDAO{

	//도서목록
	@SuppressWarnings("unchecked")
	public List<BookDTO> booklist(int page) {
		return selectList("book.booklist", page);

	}

	public int infoCheck(LoginDTO dto) {
		return (int) selectOne("login.infoCheck",dto);
	}

	public void changepw(LoginDTO dto) {
		update("login.changepw", dto);
	}


}
