package com.booknabada.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.BookDTO;
import com.booknabada.service.BookService;
import com.booknabada.util.Util;
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
	
	@RequestMapping(value = "book/bookDetail.do")
	public ModelAndView bookDetail(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("book/bookDetail");
		
		int book_no = Util.checkInt(request.getParameter("book_no")); // 책 번호 가져오기 -> 책 번호는 String으로 들어오기때문에 int형으로 변경

		System.out.println(book_no);

		BookDTO dto = bookService.bookDetail(book_no);
		mv.addObject("bookdetail", dto);
		return mv;
	}
	
}
