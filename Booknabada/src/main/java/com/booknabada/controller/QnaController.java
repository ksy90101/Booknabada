package com.booknabada.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.QnaDTO;
import com.booknabada.service.QnaService;

@Controller
public class QnaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	@RequestMapping(value="qna/qnaBoard.do")
	public ModelAndView fqa() throws Exception{
		ModelAndView mv = new ModelAndView("qna/qnaBoard");
		
		List<QnaDTO> board = qnaService.board();
		
		mv.addObject("board", board);
		return mv;
		
		
	}
	
	
	
	
}
