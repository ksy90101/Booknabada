package com.booknabada.service;

import java.util.List;
import java.util.Map;

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

	// 도서 목록
	@Override
	public List<BookDTO> booklist(int page) throws Exception {
		return bookDAO.booklist(page);
	}

	// 도서 상세 정보
	@Override
	public BookDTO bookDetail(int book_no) throws Exception {
		return bookDAO.bookDetail(book_no);
	}

	// 도서 추가
	@Override
	public void bookAddAction(BookDTO dto) throws Exception {
		bookDAO.bookAddAction(dto);
	}

	// 조회수
	@Override
	public void countUp(int book_no) throws Exception {
		bookDAO.countUp(book_no);
	}

	// 책 검색
	@Override
	public List<BookDTO> searchbooklist(Map<String, Object> map) throws Exception {
		return bookDAO.searchbooklist(map);
	}
	
}
