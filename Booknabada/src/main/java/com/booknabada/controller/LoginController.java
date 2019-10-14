package com.booknabada.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
<<<<<<< HEAD
import javax.servlet.http.HttpSession;
=======
>>>>>>> refs/remotes/origin/Yehee2

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
<<<<<<< HEAD

	@RequestMapping(value = "login.do")
	public ModelAndView login() throws Exception{
		ModelAndView mv = new ModelAndView("login");
		
		return mv;
	}
=======
>>>>>>> refs/remotes/origin/Yehee2
	
<<<<<<< HEAD
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
=======
	@RequestMapping(value = "newuser.do")
	public ModelAndView newuser(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("newuser");
		//HttpSession session = request.getSession();
>>>>>>> refs/remotes/origin/Yehee2
		
		return mv;
	}
<<<<<<< HEAD
=======

	// joinAction.do
	@RequestMapping(value = "joinAction.do")
	public ModelAndView joinAction(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:index.do");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		
		
		LoginDTO dto = new LoginDTO();
		
		dto.setUser_name(request.getParameter("name"));
		dto.setUser_id(request.getParameter("id"));
		dto.setUser_pw(request.getParameter("pw1"));
		dto.setUser_tel(request.getParameter("tel"));
		dto.setUser_email(email);
		dto.setUser_birth(request.getParameter("birth"));
		dto.setUser_gender(request.getParameter("gender"));
		
		int num = loginService.joinAction(dto);
		
		System.out.println(num);
		
		return mv;
	}
	
	
	
>>>>>>> refs/remotes/origin/Yehee2
}
