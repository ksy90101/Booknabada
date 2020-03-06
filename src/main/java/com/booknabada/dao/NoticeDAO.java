package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.ComentDTO;
import com.booknabada.dto.NoticeDTO;
import com.common.dao.AbstractDAO;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<NoticeDTO> board(int page) {
		
		return selectList("notice.board",page);
	}
	
	public NoticeDTO detail(int reBno) {
		return(NoticeDTO) selectOne("notice.detail",reBno);
	}
	
	public void countUp(int reBno) {
		update("notice.countUp",reBno);
	}
	
	public void writeAction(NoticeDTO dto) {
		insert("notice.writeAction", dto);
		
	}

	public void detailDelete(NoticeDTO dto) {
		delete("notice.detailDelete", dto);
		
	}

	public void modifyAction(NoticeDTO dto) {
		update("notice.modifyAction", dto);
	}
	
	@SuppressWarnings("unchecked")
	public List<ComentDTO> coment(int reBno) {
		return selectList("notice.coment", reBno);
	}
	
	public void comentAction(ComentDTO dto) {
		insert("notice.comentAction", dto);
	}

	public void comentDelete(ComentDTO dto) {
		delete("notice.comentDelete", dto);
	}
	
}
