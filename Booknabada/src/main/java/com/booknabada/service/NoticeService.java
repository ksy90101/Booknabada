package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.ComentDTO;
import com.booknabada.dto.NoticeDTO;


public interface NoticeService {

	List<NoticeDTO> board(int page) throws Exception;

	NoticeDTO detail(int reBno) throws Exception;

	void countUp(int reBno) throws Exception;

	void noticeWriteAction(NoticeDTO dto) throws Exception;

	void detailDelete(NoticeDTO dto) throws Exception;

	void modifyAction(NoticeDTO dto) throws Exception;
	
	List<ComentDTO> coment(int reBno) throws Exception;
	
	void comentAction(ComentDTO dto) throws Exception;

	void comentDelete(ComentDTO dto) throws Exception;

	
}
