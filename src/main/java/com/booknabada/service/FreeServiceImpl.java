package com.booknabada.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.FreeDAO;
import com.booknabada.dto.ComentDTO;
import com.booknabada.dto.FreeDTO;

@Service("freeService")
public class FreeServiceImpl implements FreeService{
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="freeDAO")
	private FreeDAO freeDAO;


	@Override
	public List<FreeDTO> board(int page) throws Exception {
		
		return freeDAO.board(page);
	}


	@Override
	public FreeDTO detail(int reBno) throws Exception {
		return freeDAO.detail(reBno);
	}


	@Override
	public void countUp(int reBno) throws Exception {
		freeDAO.countUp(reBno);
	}


	@Override
	public void freeWriteAction(FreeDTO dto) throws Exception {
		freeDAO.writeAction(dto);
	}


	@Override
	public void detailDelete(FreeDTO dto) throws Exception {
		freeDAO.detailDelete(dto);
	}


	@Override
	public void modifyAction(FreeDTO dto) throws Exception {
		freeDAO.modifyAction(dto);
		
	}


	@Override
	public List<ComentDTO> coment(int reBno) throws Exception {
		return freeDAO.coment(reBno);
	}


	@Override
	public void comentAction(ComentDTO dto) throws Exception {
		freeDAO.comentAction(dto);	
	}


	@Override
	public void comentDelete(ComentDTO dto) throws Exception {
		freeDAO.comentDelete(dto);
	}


	@Override
	public List<FreeDTO> searchAction(String search_title) throws Exception {
	
		return freeDAO.searchAction(search_title);
	}




	





	
}
