package com.booknabada.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.FqaDTO;
import com.booknabada.service.FqaService;

@Controller
public class FqaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fqaService")
	private FqaService fqaService;
	
	@RequestMapping(value="fqa.do")
	public ModelAndView fqa() throws Exception{
		ModelAndView mv = new ModelAndView("fqa");
		
		List<FqaDTO> board = fqaService.board();
		
		mv.addObject("board", board);
		return mv;
		
		
	}
	
	
	
	
}
