package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.FaqDTO;
import com.common.dao.AbstractDAO;

@Repository("faqDAO")
public class FaqDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<FaqDTO> faq_all() {
		return selectList("faq.faq_all");
	}

	@SuppressWarnings("unchecked")
	public List<FaqDTO> faq_best() {
		return selectList("faq.faq_best");
	}

	@SuppressWarnings("unchecked")
	public List<FaqDTO> faq_delivery() {
		return selectList("faq.faq_delivery");
	}

	@SuppressWarnings("unchecked")
	public List<FaqDTO> faq_homepage() {
		return selectList("faq.faq_homepage");
	}

	@SuppressWarnings("unchecked")
	public List<FaqDTO> faq_order() {
		return selectList("faq.faq_order");
	}


}
