package com.booknabada.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.LoginDTO;
import com.booknabada.service.MyService;
import com.booknabada.util.Util;
import com.common.common.CommandMap;

@Controller
public class MyController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myService")
	private MyService myService;
	
	@RequestMapping(value="my/myhome.do")
    public ModelAndView event(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView();
    	HttpSession session = request.getSession();
    	
		if(session.getAttribute("id") != null && session.getAttribute("name") != null) {
	    	String id = (String) session.getAttribute("id");
			int point = myService.getPoint(id);	    	
	    	mv.addObject("point",point);
	    	mv.setViewName("my/myhome");
		}else {
			mv.setViewName("redirect:../login/login.do");
		}	
    	
    	
    	return mv;
    }	
	
	// 회원정보변경
	@RequestMapping(value = "login/modifyuser.do")
	public ModelAndView modifyuser(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("login/modifyuser");
		
		String user_no = request.getParameter("user_no");

		// 숫자체크 후 게시판번호 담기
		int reBno = Util.checkInt(user_no);

		// 자기글 불러와서 DTO에 담기
		LoginDTO detail = myService.detail(reBno);
		
		mv.addObject("modify", detail);
		
		return mv;
	}
	
	
}
