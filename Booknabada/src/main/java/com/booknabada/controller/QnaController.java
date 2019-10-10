package com.booknabada.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
}
