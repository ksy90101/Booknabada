package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.BookDTO;
import com.booknabada.dto.LikeDTO;
import com.booknabada.dto.LoginDTO;

public interface MyService {

	// 포인트 가져오기
	int getPoint(String id) throws Exception;

	LoginDTO pabookInfo(int user_no) throws Exception;

	List<BookDTO> bookInfo(int user_no) throws Exception;

	void likeAction(LikeDTO dto) throws Exception;

	int getLikeCheck(LikeDTO dto) throws Exception;

	void likeCancel(LikeDTO dto) throws Exception;

	LoginDTO modifyuser(int user_no) throws Exception;

	void modifyuserAction(LoginDTO dto) throws Exception;


}
