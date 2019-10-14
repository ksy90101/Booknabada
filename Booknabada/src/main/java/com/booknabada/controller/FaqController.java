package com.booknabada.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.FaqDTO;
import com.booknabada.service.FaqService;
import com.common.common.CommandMap;

@Controller
public class FaqController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "faqService")
	private FaqService faqService;

	@RequestMapping(value="index.do")
    public ModelAndView index(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("index");
    	
    	return mv;
    }
	
	@RequestMapping(value="caution.do")
    public ModelAndView caution() throws Exception{
    	ModelAndView mv = new ModelAndView("caution");
    	
    	return mv;
    }
	
	@RequestMapping(value = "FAQ/FAQ_all.do")
	public ModelAndView faq_all() throws Exception {
		ModelAndView mv = new ModelAndView("FAQ/FAQ_all");

		List<FaqDTO> faq_all = faqService.faq_all();

		mv.addObject("faq_all", faq_all);
		return mv;
	}

	@RequestMapping(value = "FAQ/FAQ_best.do")
	public ModelAndView faq_best() throws Exception {
		ModelAndView mv = new ModelAndView("FAQ/FAQ_best");

		List<FaqDTO> faq_best = faqService.faq_best();

		mv.addObject("faq_best", faq_best);
		return mv;
	}
	
	
	@RequestMapping(value = "FAQ/FAQ_delivery.do")
	public ModelAndView faq_delivery() throws Exception {
		//categroy : 2
		ModelAndView mv = new ModelAndView("FAQ/FAQ_delivery");

		List<FaqDTO> faq_delivery = faqService.faq_delivery();

		mv.addObject("faq_delivery", faq_delivery);
		return mv;
	}
	
	@RequestMapping(value = "FAQ/FAQ_order.do")
	public ModelAndView faq_order() throws Exception {
		// category : 1
		ModelAndView mv = new ModelAndView("FAQ/FAQ_order");

		List<FaqDTO> faq_order = faqService.faq_order();

		mv.addObject("faq_order", faq_order);
		return mv;
	}

	@RequestMapping(value = "FAQ/FAQ_homepage.do")
	public ModelAndView faq_homepage() throws Exception {
		// categroy : 3
		ModelAndView mv = new ModelAndView("FAQ/FAQ_homepage");

		List<FaqDTO> faq_homepage = faqService.faq_homepage();

		mv.addObject("faq_homepage", faq_homepage);
		return mv;
	}
	
	@RequestMapping(value = "FAQ/FAQ_write.do")
	public ModelAndView faq_write() throws Exception{
		ModelAndView mv = new ModelAndView("FAQ/FAQ_write");
		
		return mv;
		
	}

}
