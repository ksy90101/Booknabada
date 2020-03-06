package com.booknabada.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.NoticeDAO;
import com.booknabada.dto.ComentDTO;
import com.booknabada.dto.NoticeDTO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "noticeDAO")
	private NoticeDAO noticeDAO;

	@Override
	public List<NoticeDTO> board(int page) throws Exception {

		return noticeDAO.board(page);
	}

	@Override
	public NoticeDTO detail(int reBno) throws Exception {
		return noticeDAO.detail(reBno);
	}

	@Override
	public void countUp(int reBno) throws Exception {
		noticeDAO.countUp(reBno);
	}

	@Override
	public void noticeWriteAction(NoticeDTO dto) throws Exception {
		noticeDAO.writeAction(dto);
	}

	public void detailDelete(NoticeDTO dto) throws Exception {
		noticeDAO.detailDelete(dto);
	}

	@Override
	public void modifyAction(NoticeDTO dto) throws Exception {
		noticeDAO.modifyAction(dto);
		
	}

	@Override
	public List<ComentDTO> coment(int reBno) throws Exception {
		return noticeDAO.coment(reBno);
	}

	@Override
	public void comentAction(ComentDTO dto) throws Exception {
		noticeDAO.comentAction(dto);	
	}

	@Override
	public void comentDelete(ComentDTO dto) throws Exception {
		noticeDAO.comentDelete(dto);
		
	}





	

}
