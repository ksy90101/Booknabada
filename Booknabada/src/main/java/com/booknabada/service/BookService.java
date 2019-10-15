package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.BookDTO;

public interface BookService {

	List<BookDTO> booklist() throws Exception;

	BookDTO bookDetail(int book_no) throws Exception;
	
	void bookAddAction(BookDTO dto) throws Exception;



}
