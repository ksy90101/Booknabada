package com.booknabada.controller;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.LoginDTO;
import com.booknabada.service.LoginService;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "loginService")
	private LoginService loginService;

	// 로그인 화면 
	@RequestMapping(value = "login/login.do")
	public ModelAndView login() throws Exception{
		ModelAndView mv = new ModelAndView("login/login");
		
		return mv;
	}

	// 로그인 구현
	@RequestMapping(value = "login/loginAction.do")
	public ModelAndView loginAction(HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		LoginDTO dto = new LoginDTO();
		dto.setUser_id(id);
		dto.setUser_pw(pw);
		
		int level = loginService.level(id);
		String name = loginService.login(dto);
		int user_no = loginService.user_no(dto);
		if(name != null) {
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			session.setAttribute("id", id);
			session.setAttribute("level",level);
			session.setAttribute("user_no", user_no);

			System.out.println(name);
			System.out.println(id);
			System.out.println(level);
			mv = new ModelAndView("redirect:loginComplete.do");
		}else {
			mv = new ModelAndView("redirect:login.do");
		}
		return mv;
	}
	
	@RequestMapping(value = "login/loginComplete")
	public ModelAndView loginComplete() throws Exception{
		return new ModelAndView("login/loginComplete");
	}
	@RequestMapping(value = "login/logout.do")
	public ModelAndView logout(HttpServletRequest requset) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:../index.do");
		HttpSession session = requset.getSession();
		
		if(session.getAttribute("name") != null ) {
			session.removeAttribute("name");
		}
		if(session.getAttribute("id") != null) {
			session.removeAttribute("id");
		}
		return mv;
	}

	@RequestMapping(value = "login/newuser.do")
	public ModelAndView newuser(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("login/newuser");
		//HttpSession session = request.getSession();
		
		int ran = new Random().nextInt(900000) + 100000; // 랜덤값 생성

		mv.addObject("random", ran); // 난수를 view에 전송
		return mv;
	}
	
	@RequestMapping(value = "login/findid.do")
	public ModelAndView findid(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("login/findid");
		//HttpSession session = request.getSession();
		
		return mv;
	}@RequestMapping(value = "login/findpw.do")
	public ModelAndView findpw(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("login/findpw");
		//HttpSession session = request.getSession();
		int ran = new Random().nextInt(900000) + 100000; // 랜덤값 생성

		mv.addObject("pageNum", ran); // 난수를 view에 전송
		
		return mv;
	}
	// joinAction.do
	@RequestMapping(value = "login/joinAction.do")
	public ModelAndView joinAction(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:../index.do");
		if(request.getParameter("id") != null && request.getParameter("pw1") != null && request.getParameter("pw2") != null) {
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
		} else {
			
		}			

		return mv;
	}
	@RequestMapping(value = "login/checkID.do")
	public @ResponseBody int checkID(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");
		System.out.println(id);
		int num = loginService.checkID(id); 
		System.out.println(num);
		return num;
	}

	@RequestMapping(value = "login/findidAction.do")
	public ModelAndView findidAction(HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		System.out.println(name);
		System.out.println(email);
		
		LoginDTO dto = new LoginDTO();
		dto.setUser_name(name);
		dto.setUser_email(email);

		String id = loginService.finidAction(dto);
		if(name != null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
			mv = new ModelAndView("redirect:login/findid.do");
		}else {
			mv = new ModelAndView("redirect:login/findid.do");
		}
		System.out.println(id);
		return mv;
	}
	

}
