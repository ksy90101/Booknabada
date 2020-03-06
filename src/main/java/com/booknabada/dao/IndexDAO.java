package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.BookDTO;
import com.booknabada.dto.LoginDTO;
import com.common.dao.AbstractDAO;

@Repository("indexDAO")
public class IndexDAO extends AbstractDAO{

	// 사랑받는 책 가져오기
	@SuppressWarnings("unchecked")
	public List<BookDTO> lovebook() {
		return selectList("index.lovebook");
	}

	// 사랑받는 파북이 가져오기
	@SuppressWarnings("unchecked")
	public List<LoginDTO> loveuser() {
		return selectList("index.loveuser");
	}

	// 최근 등록한 책 가져오기
	@SuppressWarnings("unchecked")
	public List<BookDTO> currentbook() {
		return selectList("index.currentbook");
	}

}
