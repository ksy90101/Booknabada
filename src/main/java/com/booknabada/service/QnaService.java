package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.QnaDTO;
import com.booknabada.dto.ComentDTO;

public interface QnaService {

	//게시판 보기
	List<QnaDTO> board(int page) throws Exception;
	
	//디테일 번호 가져오기
	QnaDTO detail(int reBno) throws Exception;
	
	//게시글 카운트
	void countUp(int reBno) throws Exception;

	void qnaWriteAction(QnaDTO dto) throws Exception;

	void detailDelete(QnaDTO dto) throws Exception;
	
	void modifyAction(QnaDTO dto) throws Exception;

	List<ComentDTO> coment(int reBno) throws Exception;
	
	void comentAction(ComentDTO dto) throws Exception;

	void comentDelete(ComentDTO dto) throws Exception;

}
