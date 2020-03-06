package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;
import com.booknabada.dto.QnaDTO;
import com.booknabada.dto.ComentDTO;

@Repository("qnaDAO")
public class QnaDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<QnaDTO> board(int page) {
		return selectList("qna.board", page);
	}
	
	public QnaDTO detail(int reBno) {
		return (QnaDTO) selectOne("qna.detail", reBno);
	}
	
	public void countUp(int reBno) {
		update("qna.countUp", reBno);
	}

	public void writeAction(QnaDTO dto) {
		insert("qna.writeAction", dto);
	}

	public void detailDelete(QnaDTO dto) {
		delete("qna.detailDelete", dto);
	}

	public void modifyAction(QnaDTO dto) {
		update("qna.modifyAction", dto);
	}

	@SuppressWarnings("unchecked")
	public List<ComentDTO> coment(int reBno) {
		return selectList("qna.coment", reBno);
	}
	
	public void comentAction(ComentDTO dto) {
		insert("qna.comentAction", dto);
	}

	public void comentDelete(ComentDTO dto) {
		delete("qna.comentDelete", dto);
	}
}
