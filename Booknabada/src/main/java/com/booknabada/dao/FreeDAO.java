package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.FreeDTO;
import com.common.dao.AbstractDAO;

@Repository("freeDAO")
public class FreeDAO extends AbstractDAO{
	
	/* SQL에서 가져오기 */
	
	@SuppressWarnings("unchecked")
	public List<FreeDTO> board() {
		return selectList("free.board");
	}
	
	public FreeDTO detail(int reBno) {
		return(FreeDTO) selectOne("free.detail",reBno);
	}
	
	public void countUp(int reBno) {
		update("free.countUp",reBno);
	}

	public void writeAction(FreeDTO dto) {
		insert("free.writeAction", dto);
		
	}

	public void detailDelete(FreeDTO dto) {
		delete("free.detailDelete", dto);
		
	}
	
	public void modifyAction(FreeDTO dto) {
		update("free.modifyAction", dto);
	}

	/*
	 * @SuppressWarnings("unchecked") public List<FreeDTO> coment(int reBno) {
	 * return selectList("free.coment", reBno); }
	 * 
	 */
	
	
}
