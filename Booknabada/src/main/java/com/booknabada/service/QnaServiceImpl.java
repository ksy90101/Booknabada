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

	@Override
	public QnaDTO detail(int reBno) throws Exception {
		return qnaDAO.detail(reBno);
	}

	@Override
	public void countUp(int reBno) throws Exception {
		qnaDAO.countUp(reBno);
	}

	@Override
	public void qnaWriteAction(QnaDTO dto) throws Exception {
		qnaDAO.writeAction(dto);
	}

	@Override
	public void detailDelete(QnaDTO dto) throws Exception {
		qnaDAO.detailDelete(dto);
	}

	@Override
	public void modifyAction(QnaDTO dto) throws Exception {
		qnaDAO.modifyAction(dto);
	}
	
	@Override
	public List<QnaDTO> coment(int reBno) throws Exception {
		return qnaDAO.coment(reBno);
	}
	
}
