package com.booknabada.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.FreeDTO;
import com.booknabada.service.FreeService;
import com.booknabada.util.Util;

@Controller
public class FreeController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "freeService")
	private FreeService freeService;

	@RequestMapping(value = "free/freeBoard.do")
	public ModelAndView freeBoard() throws Exception {
		ModelAndView mv = new ModelAndView("free/freeBoard");

		List<FreeDTO> board = freeService.board();

		mv.addObject("board", board);
		return mv;

	}

	@RequestMapping(value = "free/freeDetail.do")
	public ModelAndView freeDetail(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("free/freeDetail");

		String bno = request.getParameter("board_no");
		int reBno = Util.checkInt(bno);

		freeService.countUp(reBno);

		FreeDTO freeDetail = freeService.detail(reBno);

		mv.addObject("freeDetail", freeDetail);
		return mv;
	}

	// 글쓰기
	@RequestMapping(value = "free/freeWrite.do")
	public ModelAndView freeWrite(HttpServletRequest request) throws Exception {

		// Write.do로 가기
		return new ModelAndView("free/freeWrite");

		

	}

	// 글쓰기 실행
	@RequestMapping(value = "free/freeWriteAction.do")
	public ModelAndView writeAction(HttpServletRequest request, @RequestParam("file") MultipartFile file)
			throws Exception {

		ModelAndView mv = new ModelAndView("redirect:freeBoard.do");

		// 작성된값 가져가기
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		// 엔터키 적용
		content = content.replaceAll("\r\n", "\n");
		content = content.replaceAll("\n", "<br>");

		// 데이터베이스로 위 데이터 보내기
		FreeDTO dto = new FreeDTO();
		dto.setCate_no(1);
		dto.setBoard_title(title);
		dto.setBoard_content(content);

		// 데이터베이스 쓰기 실행
	//	freeService.freeWriteAction(dto);

		return mv;
	}

	// 글삭제
	@RequestMapping(value = "qna/detailDelete.do")
	public ModelAndView detailDetele(HttpServletRequest request) throws Exception {
//			HttpSession session = request.getSession();

		// 보드로 되돌아가기 1번
		ModelAndView mv = new ModelAndView("redirect:qnaBoard.do");

		// 세션추가
//			if (session.getAttribute("name") != null && 
//				session.getAttribute("id") != null && 
//				session.getAttribute("board3_no") != null) {
		String board_no = request.getParameter("board_no");

		// 숫자를 체크
		int detail_no = Util.checkInt("board_no");

		FreeDTO dto = new FreeDTO();
		dto.setBoard_no(detail_no);
//				dto.setUser_name((String)session.getAttribute("id"));

		// DB쪽으로 보내기
	//	freeService.detailDelete(dto);

//			} else {
//				mv.setViewName("error?code=4");
//			}

		return mv;
	}
}
