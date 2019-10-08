package com.booknabada.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.QnaDAO;
import com.booknabada.dto.QnaDTO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="qnaDAO")
	private QnaDAO qnaDAO;


	@Override
	public List<QnaDTO> board() throws Exception {
		
		return qnaDAO.board();
	}

}
