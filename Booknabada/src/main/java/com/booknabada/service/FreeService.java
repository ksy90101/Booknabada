package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.FreeDTO;

public interface FreeService {

	List<FreeDTO> board() throws Exception;
	
	FreeDTO detail(int reBno) throws Exception;
	
	void countUp(int reBno) throws Exception;

	void freeWriteAction(FreeDTO dto) throws Exception;

	void detailDelete(FreeDTO dto) throws Exception;
}
