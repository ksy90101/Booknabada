package com.booknabada.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.FaqDAO;
import com.booknabada.dto.FaqDTO;

@Service("faqService")
public class FaqServiceImpl implements FaqService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="faqDAO")
	private FaqDAO faqDAO;

	@Override
	public List<FaqDTO> faq_all() throws Exception {
		return faqDAO.faq_all();
	}

	@Override
	public List<FaqDTO> faq_best() throws Exception {
		return faqDAO.faq_best();
	}
	
	@Override
	public List<FaqDTO> faq_delivery() throws Exception {
		return faqDAO.faq_delivery();
	}

	@Override
	public List<FaqDTO> faq_homepage() throws Exception {
		
		return faqDAO.faq_homepage();
	}

	@Override
	public List<FaqDTO> faq_order() throws Exception {
		
		return faqDAO.faq_order();
	}

}
