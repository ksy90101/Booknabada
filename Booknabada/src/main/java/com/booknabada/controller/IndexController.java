package com.booknabada.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.BookDTO;
import com.booknabada.dto.LoginDTO;
import com.booknabada.service.IndexService;
import com.common.common.CommandMap;

@Controller
public class IndexController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "indexService")
	private IndexService indexService;

	// 밖에 있는 index 화면 출력
	@RequestMapping(value="index.do")
	public ModelAndView index() throws Exception{
		ModelAndView mv = new ModelAndView("index");
		
		return mv;
	}
	
	// index 화면 출력
	@RequestMapping(value="index/index.do")
    public ModelAndView index2(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("index/index");
    	
    	List<BookDTO> lovebook = indexService.lovebook();
    	List<LoginDTO> loveuser = indexService.loveuser();
    	List<BookDTO> currentbook = indexService.currentbook();
    	
    	mv.addObject("lovebook", lovebook);
    	mv.addObject("loveuser", loveuser);
    	mv.addObject("currentbook", currentbook);
    	return mv;
    }
	
	// 검색결과 존재하지 않을때 경고창
	@RequestMapping(value = "searchcaution.do")
	public ModelAndView searchcation() throws Exception{
		ModelAndView mv = new ModelAndView("searchcaution");
		
		return mv;
	}

	@RequestMapping(value="index/privacy.do")
	public ModelAndView privacy() throws Exception{
		ModelAndView mv=new ModelAndView("index/privacy");
		return mv;
	}
}
