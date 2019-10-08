package com.booknabada.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.service.SampleService;
import com.common.common.CommandMap;

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="sampleService")
	private SampleService sampleService;
	
	@RequestMapping(value="index.do")
    public ModelAndView index(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("index");
    	
    	return mv;
    }	
	
	
}
