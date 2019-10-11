package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.FreeDTO;

public interface FreeService {

	List<FreeDTO> board() throws Exception;
	//디테일 번호 가져오기
	FreeDTO detail(int reBno) throws Exception;
	//게시글 카운트
	void countUp(int reBno) throws Exception;

	void freeWriteAction(FreeDTO dto) throws Exception;

	void detailDelete(FreeDTO dto) throws Exception;
	
	void modifyAction(FreeDTO dto) throws Exception;

	List<FreeDTO> coment(int reBno) throws Exception;

}
