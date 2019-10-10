package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.QnaDTO;
import com.common.dao.AbstractDAO;

@Repository("qnaDAO")
public class QnaDAO extends AbstractDAO{
	
	/* SQL에서 가져오기 */
	
	@SuppressWarnings("unchecked")
	public List<QnaDTO> board() {
		return selectList("qna.board");
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

}
