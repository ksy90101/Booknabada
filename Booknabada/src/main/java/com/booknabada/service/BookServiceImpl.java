package com.booknabada.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.BookDAO;
import com.booknabada.dto.BookDTO;

@Service("bookService")
public class BookServiceImpl implements BookService{
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="bookDAO")
	private BookDAO bookDAO;


	@Override
	public void bookAddAction(BookDTO dto) throws Exception {
		bookDAO.bookAddAction(dto);
	}



}
