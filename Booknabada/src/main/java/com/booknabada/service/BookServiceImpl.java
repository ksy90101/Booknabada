package com.booknabada.service;

import java.util.List;

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
	public List<BookDTO> booklist() throws Exception {
		return bookDAO.booklist();
	}

	@Override
	public BookDTO bookDetail(int book_no) throws Exception {

		return bookDAO.bookDetail(book_no);
	}

	@Override
	public void bookAddAction(BookDTO dto) throws Exception {
		bookDAO.bookAddAction(dto);
	}
}
