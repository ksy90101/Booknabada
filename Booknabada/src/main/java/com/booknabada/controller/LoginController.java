package com.booknabada.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	Logger log = Logger.getLogger(this.getClass());
	

	@RequestMapping(value="login.do")
	public ModelAndView login() throws Exception{
		ModelAndView mv = new ModelAndView("login");
		
		return mv;
		
	}
	
	
	
	@RequestMapping(value="newuser.do")
	public ModelAndView newuser() throws Exception{
		ModelAndView mv = new ModelAndView("newuser");
		
		
		return mv;
		
		
	}
	@RequestMapping(value="findid.do")
	public ModelAndView findid() throws Exception{
		ModelAndView mv = new ModelAndView("findid");
		
		
		return mv;
		
		
	}
	@RequestMapping(value="findpw.do")
	public ModelAndView findpw() throws Exception{
		ModelAndView mv = new ModelAndView("findpw");
		
		
		return mv;
		
		
	}
	
	
	
}
