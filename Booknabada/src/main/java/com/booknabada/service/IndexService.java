package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.BookDTO;
import com.booknabada.dto.LoginDTO;

public interface IndexService {

	List<BookDTO> lovebook() throws Exception;

	List<LoginDTO> loveuser() throws Exception;

	List<BookDTO> currentbook() throws Exception;

}
