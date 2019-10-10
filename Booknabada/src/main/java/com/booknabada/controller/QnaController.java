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

import com.booknabada.dto.QnaDTO;
import com.booknabada.service.QnaService;
import com.booknabada.util.Util;

@Controller
public class QnaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	//게시판 띄우기
	@RequestMapping(value="qna/qnaBoard.do")
	public ModelAndView qna() throws Exception{
		ModelAndView mv = new ModelAndView("qna/qnaBoard");
		
		List<QnaDTO> board = qnaService.board();
		
		//DB에서 온 데이터 jsp에 뿌리기
		mv.addObject("board", board);
		return mv;
		
	}
	
	//상세보기
	@RequestMapping(value="qna/qnaDetail.do")
	public ModelAndView qnaDetail(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("qna/qnaDetail");
		
		//보드 숫자 가져오기
		String bno = request.getParameter("board_no");
		
		//숫자 체크
			int reBno = Util.checkInt(bno);
			
		//게시글 카운트
		qnaService.countUp(reBno);
		
		//해당 bno -> DB로 보내서 해당 글 가져오기(DTO)
		QnaDTO qnaDetail = qnaService.detail(reBno);
		
		//DB에서 온 데이터 jsp에 뿌리기
		mv.addObject("qnaDetail", qnaDetail);	
		return mv;
	}
	
	//글쓰기
	@RequestMapping(value="qna/qnaWrite.do")
	public ModelAndView qnaWrite(HttpServletRequest request) throws Exception{
		
		
		//Write.do로 가기
		return new ModelAndView("qna/qnaWrite");
		
		//로그인 한 사람만 보이게...
//		HttpSession session = request.getSession();
//				
//		if (session.getAttribute("id") != null && session.getAttribute("name") != null) {
//			return new ModelAndView("write");
//		} else {
//			return new ModelAndView("redirect:index.do");
//		}
				
	}
	
	//글쓰기 실행
	@RequestMapping(value="qna/qnaWriteAction.do")
	public ModelAndView writeAction(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception{		
//		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView("redirect:qnaBoard.do");

		//작성된값 가져가기
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//엔터키 적용
		content = content.replaceAll("\r\n", "\n");
		content = content.replaceAll("\n", "<br>");
		
		//데이터베이스로 위 데이터 보내기
		QnaDTO dto = new QnaDTO();
		dto.setCate_no(1);
		dto.setBoard_title(title);
		dto.setBoard_content(content);
//		dto.setUser_name("이건영");
//		dto.setUser_name((String)session.getAttribute("이건영"));
		
		//사진업로드
//		if (file.getOriginalFilename() != null) {
//			//지금 시간 가져오기
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//			String today = sdf.format(new Date());
//			//시간+파일이름 합치기
//			String upFileName = today + file.getOriginalFilename();
//			//파일 업로드 경로
//			String path = request.getSession().getServletContext().getRealPath("");
//			//System.out.println("리얼경로 " + path);
//			File f = new File(path + "upimg/" + upFileName); //준비
//			file.transferTo(f); //실제 파일 전송
//			
//			dto.setBoard_picture(upFileName);
//		}
		
		//데이터베이스 쓰기 실행
		qnaService.qnaWriteAction(dto);
		
		return mv;
	}
	
}
