package com.booknabada.service;

import java.util.List;
import java.util.Map;

import com.booknabada.dto.BookDTO;

public interface BookService {

	// 책 목록 보기
	List<BookDTO> booklist(int page) throws Exception;
	
	// 책 상세 보기
	BookDTO bookDetail(int book_no) throws Exception;
	
	// 책 추가
	void bookAddAction(BookDTO dto) throws Exception;

	// 조회수
	void countUp(int book_no) throws Exception;

	// 책 검색
	List<BookDTO> searchbooklist(Map<String, Object> map) throws Exception;

}
