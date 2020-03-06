package com.booknabada.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.EventDTO;
import com.booknabada.service.EventService;
import com.booknabada.util.Util;
import com.common.common.CommandMap;

@Controller
public class EventController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="eventService")
	private EventService eventService;
	
	@RequestMapping(value="event/event.do")
    public ModelAndView event(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("event/event");
    	
    	int search=0;
    	if(request.getAttribute("search") != null) {
    		search = (int) request.getAttribute("search");

	    	System.out.println(search);
    	}

    	int page =1;
    	String whatBoard = "event";
    	
    	if(search == 1) {
    		if(request.getParameter("page") != null && Integer.parseInt(String.valueOf(commandMap.get("page"))) >0){
	    		page = Integer.parseInt(String.valueOf(commandMap.get("page")));
			}

	    	List<EventDTO> eboard = eventService.eboard(((page-1)*6));
	    	
	    	mv.addObject("eboard",eboard);
	    	mv.addObject("page", page);
	    	mv.addObject("totalCount", eboard.get(0).getTotalCount());
	    	//System.out.println(eboard.get(0).getTotalCount());
    		
    	}else {
	    	if(request.getParameter("page") != null && Integer.parseInt(String.valueOf(commandMap.get("page"))) >0){
	    		page = Integer.parseInt(String.valueOf(commandMap.get("page")));
			}

	    	System.out.println(search);
	    	List<EventDTO> eboard = eventService.eboard(((page-1)*6));
	    	
	    	mv.addObject("eboard",eboard);
	    	mv.addObject("page", page);
	    	mv.addObject("totalCount", eboard.get(0).getTotalCount());
	    	//System.out.println(eboard.get(0).getTotalCount());
    	}
    	
    	if(search == 1) {
    		if(request.getParameter("page") != null && Integer.parseInt(String.valueOf(commandMap.get("page"))) >0){
	    		page = Integer.parseInt(String.valueOf(commandMap.get("page")));
			}

	    	List<EventDTO> eboard = eventService.eboard(((page-1)*6));
	    	
	    	mv.addObject("eboard",eboard);
	    	mv.addObject("page", page);
	    	mv.addObject("totalCount", eboard.get(0).getTotalCount());
	    	//System.out.println(eboard.get(0).getTotalCount());
    		
    	}else {
	    	if(request.getParameter("page") != null && Integer.parseInt(String.valueOf(commandMap.get("page"))) >0){
	    		page = Integer.parseInt(String.valueOf(commandMap.get("page")));
			}

	    	System.out.println(search);
	    	List<EventDTO> eboard = eventService.eboard(((page-1)*6));
	    	
	    	mv.addObject("eboard",eboard);
	    	mv.addObject("page", page);
	    	mv.addObject("totalCount", eboard.get(0).getTotalCount());
	    	//System.out.println(eboard.get(0).getTotalCount());
    	}
    	if(search == 1) {
    		if(request.getParameter("page") != null && Integer.parseInt(String.valueOf(commandMap.get("page"))) >0){
	    		page = Integer.parseInt(String.valueOf(commandMap.get("page")));
			}

	    	List<EventDTO> eboard = eventService.eboard(((page-1)*6));
	    	
	    	mv.addObject("eboard",eboard);
	    	mv.addObject("page", page);
	    	mv.addObject("totalCount", eboard.get(0).getTotalCount());
	    	//System.out.println(eboard.get(0).getTotalCount());
    		
    	}else {
	    	if(request.getParameter("page") != null && Integer.parseInt(String.valueOf(commandMap.get("page"))) >0){
	    		page = Integer.parseInt(String.valueOf(commandMap.get("page")));
			}

	    	System.out.println(search);
	    	List<EventDTO> eboard = eventService.eboard(((page-1)*6));
	    	
	    	mv.addObject("eboard",eboard);
	    	mv.addObject("page", page);
	    	mv.addObject("totalCount", eboard.get(0).getTotalCount());
	    	//System.out.println(eboard.get(0).getTotalCount());
    	}
    	if(search == 1) {
    		if(request.getParameter("page") != null && Integer.parseInt(String.valueOf(commandMap.get("page"))) >0){
	    		page = Integer.parseInt(String.valueOf(commandMap.get("page")));
			}

	    	List<EventDTO> eboard = eventService.eboard(((page-1)*6));
	    	
	    	mv.addObject("eboard",eboard);
	    	mv.addObject("page", page);
	    	mv.addObject("totalCount", eboard.get(0).getTotalCount());
	    	//System.out.println(eboard.get(0).getTotalCount());
    		
    	}else {
	    	if(request.getParameter("page") != null && Integer.parseInt(String.valueOf(commandMap.get("page"))) >0){
	    		page = Integer.parseInt(String.valueOf(commandMap.get("page")));
			}

	    	System.out.println(search);
	    	List<EventDTO> eboard = eventService.eboard(((page-1)*6));
	    	
	    	mv.addObject("eboard",eboard);
	    	mv.addObject("page", page);
	    	mv.addObject("totalCount", eboard.get(0).getTotalCount());
	    	//System.out.println(eboard.get(0).getTotalCount());
    	}
    	List<EventDTO> eboard = eventService.eboard(((page-1)*6));
    	
    	mv.addObject("eboard",eboard);
    	mv.addObject("page", page);
    	mv.addObject("totalCount", eboard.get(0).getTotalCount());
    	//System.out.println(eboard.get(0).getTotalCount());
    	
    	mv.addObject("whatBoard", whatBoard);
    	return mv;
    }	
	
	@RequestMapping(value="event/eventWrite.do")
    public ModelAndView eventWrite(HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView();
    	HttpSession session = request.getSession();
    	int level = Integer.parseInt((String) session.getAttribute("level"));
 
    	System.out.println(session.getAttribute("level"));
    	int level = Integer.parseInt((String) session.getAttribute("level"));
    	 
    	String whatBoard = "event";
    	mv.addObject("whatBoard", whatBoard);
    	
    	if(level != 1) {
    		mv.setViewName("redirect:event.do");
    	}else {
    		mv.setViewName("event/eventWrite");
    	}
    	
    	return mv;
    }	
	
	@RequestMapping(value="event/eventWriteAction.do")
    public ModelAndView eventWriteAction(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:event.do");
    	String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		String id = (String) session.getAttribute("id");
		
		EventDTO dto = new EventDTO();
		dto.setUser_name(name);
		dto.setUser_id(id);
		dto.setEvent_title(title);
		dto.setEvent_content(content); //?ç∞?ù¥?Ñ∞ ?Öã?åÖ
		
		if(file.getSize() != 0) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			String today = sdf.format(new Date());
			String upFileName = today+"_"+file.getOriginalFilename();
			
			//?åå?ùº ?óÖÎ°úÎìú Í≤ΩÎ°ú
			String path = request.getSession().getServletContext().getRealPath("");
			System.out.println("Î¶¨ÏñºÍ≤ΩÎ°ú : "+path);
			File f = new File(path+"upimg/"+upFileName); //Ï§?Îπ?
			file.transferTo(f); //?ã§?†ú ?åå?ùº ?†Ñ?Ü°
			//System.out.println("???û•Í≤ΩÎ°ú : "+f.getPath());	

			dto.setEvent_picture(upFileName);
		}
		
		eventService.writeAction(dto);
		
		return mv;
   	
    }	
	
	@RequestMapping(value="event/eventDetail.do")
	public ModelAndView detail(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("event/eventDetail");
		String bno = request.getParameter("bno");
		int reBno = Util.checkInt(bno);
		//System.out.println(reBno);
		String whatBoard = "event";

		
		//count up?ùÑ ?ñ¥?îî?Ñú ?ïò?Éê~!
		eventService.countUp(reBno);
		
		EventDTO detail = eventService.detail(reBno); //?†àÏΩîÎìú ?ïúÏ§ÑÏùÑ dtoÍ∞? Î∞õÏùÑÍ±∞ÏûÑ!
		
		//?åìÍ∏??ùò ?à´?ûêÍ∞? Î™áÏù∏Ïß???
		//System.out.println("?åìÍ∏??àò : "+detail.getCommentcount());
		//if(detail.getCommentcount()>0) {
			//?åìÍ∏? Í∞??†∏?ò§Í∏?
			//1.CommentDTO
			//2.list
			//List<CommentDTO> comment = sampleService.comment(reBno);
			//mv.addObject("comment",comment);
		//}		
		//jspÎ°? ?ÑòÍ∏∞Í∏∞
		mv.addObject("detail",detail);
		mv.addObject("whatBoard", whatBoard);
		return mv;
	}
	
	
	@RequestMapping(value="event/eventDelete.do")
    public ModelAndView eventDelete(HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:event.do");
    	HttpSession session = request.getSession();
    	
    	if(session.getAttribute("name") != null && 
				session.getAttribute("id") != null && 
				request.getParameter("bno") != null) {
    		int reBno = Util.checkInt(request.getParameter("bno"));
        	
    		EventDTO dto = new EventDTO();
    		dto.setEvent_no(reBno);
    		dto.setUser_id((String) session.getAttribute("id"));
    		eventService.eventDelete(dto);
    		
    		String whatBoard = "event";
    		mv.addObject("whatBoard", whatBoard);
    	}else {
    		mv.setViewName("error?code=4");
    	}
		    	
		return mv;
   	
    }	
	
	@RequestMapping(value="event/eventModify.do")
    public ModelAndView eventModify(HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView();
    	HttpSession session = request.getSession();
    	String id = (String) session.getAttribute("id");
    	System.out.println(id);
    			
		int reBno = Util.checkInt(request.getParameter("bno"));
		
		EventDTO detail = eventService.detail(reBno);
		//System.out.println(detail.getUser_id());
		
		if(detail.getUser_id().equals(id)) {
			mv.setViewName("event/eventModify");
			mv.addObject("detail",detail);
			String whatBoard = "event";
			mv.addObject("whatBoard", whatBoard);
		}else {
			mv.setViewName("error?code=3");
		}
    			
		return mv;
   	
    }	
	
	@RequestMapping(value="event/eventModifyAction.do")
	public ModelAndView eventModifyAction(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception{
		int reBno = Util.checkInt(request.getParameter("bno"));
		ModelAndView mv = new ModelAndView("redirect:eventDetail.do?bno="+reBno);
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		EventDTO detail = new EventDTO();
		detail.setEvent_no(reBno);
		detail.setEvent_title(title);
		detail.setEvent_content(content);
		//System.out.println(file.getOriginalFilename());
		
		if(file.getOriginalFilename() != "") { //?àò?†ï?ïò?†§Í≥? ?ÉàÎ°? ?ò¨Î¶¨Îäî ?åå?ùº?ù¥ ?ûá?ã§Î©?!
			String[] bFile =request.getParameter("bFile").split("_", 2);
			//System.out.println(bFile[1]);
			
			if(!file.getOriginalFilename().equals(bFile[1])) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
				String today = sdf.format(new Date());
				String upFileName = today +"_"+ file.getOriginalFilename();
				
				//?åå?ùº ?óÖÎ°úÎìú Í≤ΩÎ°ú
				String path = request.getSession().getServletContext().getRealPath("");
				System.out.println("Î¶¨ÏñºÍ≤ΩÎ°ú : "+path);
				File f = new File(path+"upimg/"+upFileName); //Ï§?Îπ?
				file.transferTo(f); //?ã§?†ú ?åå?ùº ?†Ñ?Ü°
				//System.out.println("???û•Í≤ΩÎ°ú : "+f.getPath());	

				detail.setEvent_picture(upFileName);
			}
		}else {
			detail.setEvent_picture(null);
		}
		
		eventService.eventModify(detail);
		
		
		return mv;
	}
	
	
	
}
