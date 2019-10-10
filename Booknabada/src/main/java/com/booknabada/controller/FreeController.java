package com.booknabada.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.FreeDTO;
import com.booknabada.service.FreeService;
import com.booknabada.util.Util;

@Controller
public class FreeController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="freeService")
	private FreeService freeService;
	
	@RequestMapping(value="free/freeBoard.do")
	public ModelAndView freeBoard() throws Exception{
		ModelAndView mv = new ModelAndView("free/freeBoard");
		
		List<FreeDTO> board = freeService.board();
		
		mv.addObject("board", board);
		return mv;
		
		
	}
	
	
	@RequestMapping(value="free/freeDetail.do")
	public ModelAndView freeDetail(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("free/freeDetail");
		
		String bno=request.getParameter("board_no");
		int reBno=Util.checkInt(bno);
		
		freeService.countUp(reBno);
		
		FreeDTO freeDetail = freeService.detail(reBno);
		
		mv.addObject("freeDetail",freeDetail);
		return mv;
	}	
	
	/*
	 * @RequestMapping(value = "free/freeWrite.do") public ModelAndView
	 * freeWrite(HttpServletRequest request) throws Exception { HttpSession session
	 * = request.getSession();
	 * 
	 * }
	 */
	
	
}
