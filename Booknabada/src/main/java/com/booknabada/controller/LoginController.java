package com.booknabada.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.LoginDTO;
import com.booknabada.service.LoginService;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "loginService")
	private LoginService loginService;

	@RequestMapping(value = "login.do")
	public ModelAndView login() throws Exception{
		ModelAndView mv = new ModelAndView("login");
		
		return mv;
	}
	
	@RequestMapping(value = "loginAction.do")
	public ModelAndView loginAction(HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		LoginDTO dto = new LoginDTO();
		dto.setUser_id(id);
		dto.setUser_pw(pw);
		
		String name = loginService.login(dto);
		if(name != null) {
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			session.setAttribute("id", id);
			
			mv = new ModelAndView("redirect:index.do");
		}else {
			mv = new ModelAndView("redirect:login.do");
		}
		
		return mv;
	}
}
