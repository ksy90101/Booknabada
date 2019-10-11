package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.FaqDTO;

public interface FaqService {

	List<FaqDTO> faq_all() throws Exception;

	List<FaqDTO> faq_best() throws Exception;

	List<FaqDTO> faq_delivery() throws Exception;

	List<FaqDTO> faq_homepage() throws Exception;

	List<FaqDTO> faq_order() throws Exception;
}
