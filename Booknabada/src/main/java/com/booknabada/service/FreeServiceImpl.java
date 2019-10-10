package com.booknabada.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.FreeDAO;
import com.booknabada.dto.FreeDTO;

@Service("freeService")
public class FreeServiceImpl implements FreeService{
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="freeDAO")
	private FreeDAO freeDAO;


	@Override
	public List<FreeDTO> board() throws Exception {
		
		return freeDAO.board();
	}


	@Override
	public FreeDTO detail(int reBno) throws Exception {
		return freeDAO.detail(reBno);
	}


	@Override
	public void countUp(int reBno) throws Exception {
		freeDAO.countUp(reBno);
	}

}
