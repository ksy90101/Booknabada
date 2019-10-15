package com.booknabada.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.FaqDTO;
import com.booknabada.service.FaqService;
import com.booknabada.util.Util;
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
	
	@RequestMapping(value = "faq/faqboardall.do")
	public ModelAndView faqboardall() throws Exception {
		ModelAndView mv = new ModelAndView("faq/faqboardall");

		List<FaqDTO> faqboardall = faqService.faqboardall();

		mv.addObject("faqboardall", faqboardall);
		return mv;
	}

	@RequestMapping(value = "faq/faqboardbest.do")
	public ModelAndView faqboardbest() throws Exception {
		ModelAndView mv = new ModelAndView("faq/faqboardbest");

		List<FaqDTO> faqboardbest = faqService.faqboardbest();

		mv.addObject("faqboardbest", faqboardbest);
		return mv;
	}
	
	
	@RequestMapping(value = "faq/faqboarddelivery.do")
	public ModelAndView faqboarddelivery() throws Exception {
		//categroy : 2
		ModelAndView mv = new ModelAndView("faq/faqboarddelivery");

		List<FaqDTO> faqboarddelivery = faqService.faqboarddelivery();

		mv.addObject("faqboarddelivery", faqboarddelivery);
		return mv;
	}
	
	@RequestMapping(value = "faq/faqboardorder.do")
	public ModelAndView faqboardorder() throws Exception {
		// category : 1
		ModelAndView mv = new ModelAndView("faq/faqboardorder");

		List<FaqDTO> faqboardorder = faqService.faqboardorder();

		mv.addObject("faqboardorder", faqboardorder);
		return mv;
	}

	@RequestMapping(value = "faq/faqboardhomepage.do")
	public ModelAndView faqboardhomepage() throws Exception {
		// categroy : 3
		ModelAndView mv = new ModelAndView("faq/faqboardhomepage");

		List<FaqDTO> faqboardhomepage = faqService.faqboardhomepage();

		mv.addObject("faqboardhomepage", faqboardhomepage);
		return mv;
	}
	
	@RequestMapping(value = "faq/faqwrite.do")
	public ModelAndView faqboardwrite(HttpServletRequest requset) throws Exception{
		
		HttpSession session = requset.getSession();
		if (session.getAttribute("id") != null && session.getAttribute("name") != null) {
			return new ModelAndView("faq/faqwrite");
		}else {
			return new ModelAndView("redirect:../index.do");
		}
		
	}
	
	@RequestMapping(value = "faq/faqWriteAction.do")
	public ModelAndView faqWriteAction(HttpServletRequest requset) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:faqboardall.do");
		
		String qustion = requset.getParameter("title");
		String answer = requset.getParameter("content");
		
		answer = answer.replace("\r\n", "\n");
		answer = answer.replace("\n", "<br>");
		
		FaqDTO dto = new FaqDTO();
		dto.setFaq_category(Integer.parseInt(requset.getParameter("cate")));
		dto.setFaq_answer(answer);
		dto.setFaq_qustion(qustion);
		faqService.faqWriteAction(dto);
		
		return mv;
	}

	@RequestMapping(value = "faq/faqDelete.do")
	public ModelAndView faqDelete(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:faqboardall.do");
		
		int faq_no = Util.checkInt(request.getParameter("faq_no"));
		
		FaqDTO dto = new FaqDTO();
		dto.setFaq_no(faq_no);
		
		faqService.faqDelete(dto);
		
		return mv;
	}
	
	@RequestMapping(value = "faq/faqModify.do")
	public ModelAndView faqModify(HttpServletRequest requset) throws Exception{
		ModelAndView mv = new ModelAndView("faq/faqModify");
		
		int faq_no = Util.checkInt(requset.getParameter("faq_no"));
		
		FaqDTO detail = faqService.detail(faq_no);

		mv.addObject("modify", detail);
		return mv;
	}
	
	@RequestMapping(value = "faq/faqModifyAction.do")
	public ModelAndView faqModifyAction(HttpServletRequest request) throws Exception{
		String faq_no = request.getParameter("faq_no");
		ModelAndView mv = new ModelAndView("redirect:faq/faqboardall.do");
		
		String qustion= request.getParameter("title");
		String answer = request.getParameter("content");
		
		answer = answer.replace("\r\n", "\r");
		answer = answer.replace("\n", "<br>");
		
		FaqDTO dto = new FaqDTO();
		dto.setFaq_qustion(qustion);
		dto.setFaq_answer(answer);
		dto.setFaq_no(Util.checkInt(faq_no));
		
		faqService.faqModifyAction(dto);
		
		return mv;
	}
}
