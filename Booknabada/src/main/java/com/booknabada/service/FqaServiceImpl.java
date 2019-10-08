package com.booknabada.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.FqaDAO;
import com.booknabada.dto.FqaDTO;

@Service("fqaService")
public class FqaServiceImpl implements FqaService{
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="fqaDAO")
	private FqaDAO fqaDAO;


	@Override
	public List<FqaDTO> board() throws Exception {
		
		return fqaDAO.board();
	}

}
