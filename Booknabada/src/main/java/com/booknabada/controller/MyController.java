package com.booknabada.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.BookDTO;
import com.booknabada.dto.LikeDTO;
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
	
	
	//파북이 개인페이지
	@RequestMapping(value="my/pabook.do")
    public ModelAndView pabook(HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView();
    	HttpSession session = request.getSession();
    	int user_no = Util.checkInt(request.getParameter("pabook_no"));

    	LoginDTO pabookInfo = myService.pabookInfo(user_no);
    	String like_to = pabookInfo.getUser_id();
    	String like_from = (String) session.getAttribute("id"); //like_from
    	
    	LikeDTO dto = new LikeDTO();
    	dto.setLike_to(like_to);
    	dto.setLike_from(like_from);

    	int likeChk = myService.getLikeCheck(dto);	

    	List<BookDTO> bookInfo = myService.bookInfo(user_no);
    	int likeCnt = myService.likeCnt(like_to);
    	
    	//System.out.println(like_to);
    	//System.out.println(likeCnt);
    	
    	mv.addObject("likeCnt",likeCnt);
    	mv.addObject("pabook_no",user_no);
    	mv.addObject("pabookInfo",pabookInfo);
    	mv.addObject("bookInfo",bookInfo);
    	mv.addObject("likeChk",likeChk);
    	    	
    	mv.setViewName("my/pabook");
    	return mv;
    }	
	
	//좋아요 액션!
	@RequestMapping(value="my/likeAction.do")
    public ModelAndView likeAction(HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView();
    	HttpSession session =request.getSession();
    	
    	if(session.getAttribute("id") != null && session.getAttribute("name") != null) {
    		int user_no = Util.checkInt(request.getParameter("pabook_no"));
    	
    		LoginDTO pabookInfo = myService.pabookInfo(user_no);
	    	String like_to = pabookInfo.getUser_id();
	    	String like_from = (String) session.getAttribute("id"); //like_from
	    	//System.out.println(like_to);
	    	//System.out.println(like_from);
	    	
	    	LikeDTO dto = new LikeDTO();
	    	dto.setLike_to(like_to);
	    	dto.setLike_from(like_from);

	    	int likeChk = myService.getLikeCheck(dto);	
	    	
	    	if(likeChk == 0) { //좋아요를 누른적이 없다면
		    	myService.likeAction(dto);
		    			    	
		    	mv.addObject("pabook_no",user_no);
		    	mv.addObject("likeChk",likeChk);
		    	mv.setViewName("redirect:pabook.do");
		    	
	    	}else { //좋아요를 누른적이 있다면
		    	mv.addObject("pabook_no",user_no);
	    		mv.addObject("likeChk",likeChk);
		    	mv.setViewName("redirect:pabook.do");
	    	}
	    	
	    	//좋아요 취소하기 선택으로 왔다면
	    	if(request.getParameter("likeCancel") != null) { 
	        	String likeCancel = request.getParameter("likeCancel");
	        	if(likeCancel.equals("true")) {
	        		myService.likeCancel(dto);
	        	}
	    	}
	    
    	}else {
			mv.setViewName("redirect:../login/login.do");
		}	
    	
    	return mv;
    }	
	
	
	
}
