package com.booknabada.dao;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.BookDTO;
import com.common.dao.AbstractDAO;

@Repository("bookDAO")
public class BookDAO extends AbstractDAO{

	public void bookAddAction(BookDTO dto) {
		insert("book.bookAddAction", dto);		
	}
	
	
}
