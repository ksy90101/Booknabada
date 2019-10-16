package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.BookDTO;
import com.common.dao.AbstractDAO;

@Repository("bookDAO")
public class BookDAO extends AbstractDAO{

	//도서목록
	@SuppressWarnings("unchecked")
	public List<BookDTO> booklist(int page) {
		return selectList("book.booklist", page);

	}
	
	// 도서 상세 정보
	public BookDTO bookDetail(int book_no) {
		return (BookDTO) selectOne("book.bookdetail", book_no);
	}

	// 도서 추가
	public void bookAddAction(BookDTO dto) {
		insert("book.bookAddAction", dto);		
	}

}
