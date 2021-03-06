package com.booknabada.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.BookDTO;
import com.booknabada.dto.OrderDTO;
import com.booknabada.service.BookService;
import com.booknabada.service.OrderService;
import com.booknabada.util.Util;
import com.common.common.CommandMap;

@Controller
public class BookController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="bookService")
	private BookService bookService;
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	// 무한스크롤 구현
	@RequestMapping(value = "book/infiniteScrollDown.do")
	@ResponseBody
	public List<BookDTO> infiniteScrollDown(@RequestBody Map<String, Object> map) throws Exception {
		int page = (int) map.get("page");
		System.out.println(page);
		return bookService.booklist((page-1)*15);
	}
	
	// 책 목록 보기
	@RequestMapping(value="book/booklist.do")
	public ModelAndView booklist(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("book/booklist");
    	
		int page = 1;
   
    	List<BookDTO> booklist = bookService.booklist(((page-1) * 15));
    	mv.addObject("booklist", booklist);
    	return mv;
    }
	
	// 책 상세 보기
	@RequestMapping(value = "book/bookDetail.do")
	public ModelAndView bookDetail(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("book/bookDetail");
		
		int book_no = Util.checkInt(request.getParameter("book_no")); // 책 번호 가져오기 -> 책 번호는 String으로 들어오기때문에 int형으로 변경
		System.out.println(book_no);

		bookService.countUp(book_no);
		
		BookDTO dto = bookService.bookDetail(book_no);
		mv.addObject("bookdetail", dto);
		return mv;
	}
	
	//장바구니 추가실행
	@RequestMapping(value = "book/wishlistAction.do")
	public ModelAndView wishlistAction(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		int book_no = Util.checkInt(request.getParameter("book_no")); // 책 번호 가져오기 -> 책 번호는 String으로 들어오기때문에 int형으로 변경
		
		if(session.getAttribute("id") != null && session.getAttribute("name") != null) {
			mv.setViewName("book/bookDetail");
			
			OrderDTO dto = new OrderDTO();
			dto.setBook_no(book_no);
			dto.setUser_name((String)session.getAttribute("id"));
			
			//DB쪽으로 보내기
    		orderService.wishlistAction(dto);
    	}else {
    		mv.setViewName("redirect:../login/login.do");
    	}
		
		//화면에 뿌려주기
		BookDTO dto = bookService.bookDetail(book_no);
		mv.addObject("bookdetail", dto);
	
		return mv;
	}
	
	// 책 추가 페이지
	@RequestMapping(value="book/bookadd.do")
    public ModelAndView bookadd(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView();
    	HttpSession session = request.getSession();
    	if(session.getAttribute("id") != null && session.getAttribute("name") != null) {
    		mv.setViewName("book/bookadd");
    	}else {
    		mv.setViewName("redirect:../login/login.do");
    	}
    	return mv;
    }	
	
	// 책 추가
	@RequestMapping(value="book/bookAddAction.do")
    public ModelAndView bookAddAction(CommandMap commandMap, HttpServletRequest request, @RequestParam("book_picture") MultipartFile file) throws Exception{
    	ModelAndView mv = new ModelAndView();
    	HttpSession session = request.getSession();
		
    	if(session.getAttribute("id") != null && session.getAttribute("name") != null) {
    		
    		String id = (String) session.getAttribute("id");

    		//System.out.println(name);

        	String book_title = request.getParameter("book_title");
        	String book_author = request.getParameter("book_author");
        	String book_pubdate = request.getParameter("book_pubdate"); 
        	int book_page = Util.checkInt(request.getParameter("book_page")); 
        	String book_publisher = request.getParameter("book_publisher"); 
        	String book_cate = request.getParameter("book_cate"); 
        	String price_select = request.getParameter("price_select"); 
        	int book_price = Util.checkInt(request.getParameter("book_price")); 
        	String book_content = request.getParameter("book_content"); 
        	System.out.println(id);
        	
        	BookDTO dto = new BookDTO();
        	dto.setBook_title(book_title);
        	dto.setBook_author(book_author);
        	dto.setBook_pubdate(book_pubdate);
        	dto.setBook_page(book_page);
        	dto.setBook_publisher(book_publisher);
        	dto.setBook_cate(book_cate);
        	dto.setPrice_select(price_select);
        	dto.setBook_price(book_price);
        	dto.setBook_content(book_content);
        	dto.setUser_id(id);
        	
        	if(file.getSize() != 0) {
    			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
    			String today = sdf.format(new Date());
    			String upFileName = today+"_"+file.getOriginalFilename();	
    			//파일 업로드 경로
    			String path = "/home/booknabada/webapps/upload/";
    			System.out.println("리얼경로 : "+path);
    			File f = new File(path+"upimg/"+upFileName); //준비
    			file.transferTo(f); //실제 파일 전송
    			//System.out.println("저장경로 : "+f.getPath());	

    			dto.setBook_picture(upFileName);
    		}else {
    			dto.setBook_picture(null);
    		}
        	bookService.bookAddAction(dto);
        	
        	//mv.addObject("book",dto);    	
    		mv.setViewName("redirect:../my/myhome.do");
    	}else {
    		mv.setViewName("redirect:../login/login.do");
    	}

    	return mv;
    }	
		
	// 책 검색
	@RequestMapping(value="book/searchbooklist.do")
	public ModelAndView searchbooklist(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(request.getParameter("search").equals("")) {
			return new ModelAndView("redirect:booklist");
		}else {
		   	int page = 1;
	    	
	    	if(request.getParameter("page") != null) {
	    		page = Util.checkInt(request.getParameter("page"));
	    	}
	    	if(commandMap.get("page") != null) {
	    		page = Util.checkInt((String) commandMap.get("page"));
	    	}
			String searchword = "%" + request.getParameter("search") + "%";
			System.out.println(searchword);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sw", searchword);
			map.put("pg", (page -1) * 15);
			
			System.out.println(map.get("sw"));
			System.out.println(map.get("page"));
			List<BookDTO> list = bookService.searchbooklist(map);
			System.out.println(list);
			if(list.isEmpty()) {
				mv.setViewName("redirect:../searchcaution.do");
			}else {
			mv.setViewName("book/searchbooklist");
			mv.addObject("sbl", list);
			mv.addObject("page", page);
			}
			return mv;			
		}
	}

}