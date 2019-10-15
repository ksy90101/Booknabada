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
	public List<FaqDTO> faqboardall() throws Exception {
		return faqDAO.faqboardall();
	}

	@Override
	public List<FaqDTO> faqboardbest() throws Exception {
		return faqDAO.faqboardbest();
	}
	
	@Override
	public List<FaqDTO> faqboarddelivery() throws Exception {
		return faqDAO.faqboarddelivery();
	}

	@Override
	public List<FaqDTO> faqboardhomepage() throws Exception {
		
		return faqDAO.faqboardhomepage();
	}

	@Override
	public List<FaqDTO> faqboardorder() throws Exception {
		
		return faqDAO.faqboardorder();
	}

	@Override
	public void faqWriteAction(FaqDTO dto) throws Exception {
		faqDAO.faqwriteAction(dto);
		
	}

	@Override
	public void faqDelete(FaqDTO dto) throws Exception {
		faqDAO.faqDelete(dto);
		
	}

	@Override
	public FaqDTO detail(int faq_no) throws Exception {
		return faqDAO.detail(faq_no);
	}

	@Override
	public void faqModifyAction(FaqDTO dto) throws Exception {
		faqDAO.faqModifyAction(dto);
		
	}

}
