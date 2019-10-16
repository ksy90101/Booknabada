package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.FaqDTO;
import com.common.dao.AbstractDAO;

@Repository("faqDAO")
public class FaqDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<FaqDTO> faqboardall() {
		return selectList("faq.faqboardall");
	}

	@SuppressWarnings("unchecked")
	public List<FaqDTO> faqboardbest() {
		return selectList("faq.faqboardbest");
	}

	@SuppressWarnings("unchecked")
	public List<FaqDTO> faqboarddelivery() {
		return selectList("faq.faqboarddelivery");
	}

	@SuppressWarnings("unchecked")
	public List<FaqDTO> faqboardhomepage() {
		return selectList("faq.faqboardhomepage");
	}

	@SuppressWarnings("unchecked")
	public List<FaqDTO> faqboardorder() {
		return selectList("faq.faqboardorder");
	}

	public void faqwriteAction(FaqDTO dto) {
		insert("faq.faqWriteAction", dto);
	}

	public void faqDelete(FaqDTO dto) {
		delete("faq.faqDelete", dto);
		
	}

	public FaqDTO detail(int faq_no) {
		return (FaqDTO) selectOne("faq.detail", faq_no);
}

	public void faqModifyAction(FaqDTO dto) {
		update("faq.faqModifyAction", dto);
		
	}


}
