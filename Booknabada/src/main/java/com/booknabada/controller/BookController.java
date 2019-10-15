package com.booknabada.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.BookDTO;
import com.booknabada.service.BookService;
import com.common.common.CommandMap;

@Controller
public class BookController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "bookService")
	private BookService bookService;

	@RequestMapping(value="book/booklist.do")
    public ModelAndView booklist(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("book/booklist");
    	
    	List<BookDTO> booklist = bookService.booklist();
    	
    	mv.addObject("booklist", booklist);
    	
    	return mv;
    }	
	
}
