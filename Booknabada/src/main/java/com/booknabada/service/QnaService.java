package com.booknabada.service;

import java.util.List;
import java.util.Map;

import com.booknabada.dto.QnaDTO;

public interface QnaService {

	List<QnaDTO> board() throws Exception;
	
	//디테일 번호 가져오기
	QnaDTO detail(int reBno) throws Exception;
	
	//게시글 카운트
	void countUp(int reBno) throws Exception;

	void qnaWriteAction(QnaDTO dto) throws Exception;

	void detailDelete(QnaDTO dto) throws Exception;
	
	void modifyAction(QnaDTO dto) throws Exception;

//	List<QnaDTO> coment(int reBno) throws Exception;
	

}
