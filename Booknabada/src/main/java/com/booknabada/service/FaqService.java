package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.FaqDTO;

public interface FaqService {

	List<FaqDTO> faqboardall() throws Exception;

	List<FaqDTO> faqboardbest() throws Exception;

	List<FaqDTO> faqboarddelivery() throws Exception;

	List<FaqDTO> faqboardhomepage() throws Exception;

	List<FaqDTO> faqboardorder() throws Exception;

	void faqWriteAction(FaqDTO dto) throws Exception;

	void faqDelete(FaqDTO dto) throws Exception;

}
