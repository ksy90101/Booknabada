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

	// 게시판 띄우기
	@RequestMapping(value = "free/freeBoard.do")
	public ModelAndView freeBoard() throws Exception {
		ModelAndView mv = new ModelAndView("free/freeBoard");

		List<FreeDTO> board = freeService.board();
		// DB에서 온 데이터 jsp에 뿌리기
		String whatBoard = "free";

		mv.addObject("whatBoard", whatBoard);
		mv.addObject("board", board);
		return mv;

	}

	// 상세보기
	@RequestMapping(value = "free/freeDetail.do")
	public ModelAndView freeDetail(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("free/freeDetail");
		// 보드 숫자 가져오기
		String bno = request.getParameter("board_no");
		// 숫자 체크
		int reBno = Util.checkInt(bno);
		// 게시글 카운트
		freeService.countUp(reBno);

		// 해당 bno -> DB로 보내서 해당 글 가져오기(DTO)
		FreeDTO freeDetail = freeService.detail(reBno);
		/*
//		 * List<FreeDTO> coment = freeService.coment(reBno);
		 */
		// DB에서 온 데이터 jsp에 뿌리기
		
		String whatBoard = "free";

		mv.addObject("whatBoard", whatBoard);
		mv.addObject("freeDetail", freeDetail);
//		/* mv.addObject("coment", coment); */
		return mv;
	}

	// 글쓰기
	@RequestMapping(value = "free/freeWrite.do")
	public ModelAndView freeWrite(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("free/freeWrite");
		// Write.do로 가기
		
		String whatBoard = "free";

		mv.addObject("whatBoard", whatBoard);
		return new ModelAndView("");

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

		// 사진업로드
//		if (file.getOriginalFilename() != null) {
//			// 지금 시간 가져오기
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//			String today = sdf.format(new Date());
//			// 시간+파일이름 합치기
//			String upFileName = today + file.getOriginalFilename();
//			// 파일 업로드 경로
//			String path = request.getSession().getServletContext().getRealPath("");
//			// System.out.println("리얼경로 " + path);
//			File f = new File(path + "upimg/" + upFileName); // 준비
//			file.transferTo(f); // 실제 파일 전송
//
//			dto.setBoard_picture(upFileName);
//		}

		// 데이터베이스 쓰기 실행
		freeService.freeWriteAction(dto);
		
		String whatBoard = "free";

		mv.addObject("whatBoard", whatBoard);

		return mv;
	}

	// 글삭제 실행
	@RequestMapping(value = "free/detailDelete.do")
	public ModelAndView detailDetele(HttpServletRequest request) throws Exception {
//			HttpSession session = request.getSession();

		// 보드로 되돌아가기 1번
		ModelAndView mv = new ModelAndView("redirect:freeBoard.do");

		// 세션추가
//			if (session.getAttribute("name") != null && 
//				session.getAttribute("id") != null && 
//				session.getAttribute("board3_no") != null) {
		String board_no = request.getParameter("board_no");

		// 숫자를 체크
		int detail_no = Util.checkInt(board_no);

		FreeDTO dto = new FreeDTO();
		dto.setBoard_no(detail_no);
//				dto.setUser_name((String)session.getAttribute("id"));

		// DB쪽으로 보내기
		freeService.detailDelete(dto);

//			} else {
//				mv.setViewName("error?code=4");
//			}
		
		String whatBoard = "free";

		mv.addObject("whatBoard", whatBoard);

		return mv;
	}

	// 수정페이지 이동
	@RequestMapping(value = "free/freeModify.do")
	public ModelAndView detailModify(HttpServletRequest request) throws Exception {
//			HttpSession session = request.getSession();

		// 수정버튼 누르면 수정페이지로 이동
		ModelAndView mv = new ModelAndView("free/freeModify");

		String board_no = request.getParameter("board_no");

		// 숫자체크 후 게시판번호 담기
		int reBno = Util.checkInt(board_no);

		// 자기글 불러와서 DTO에 담기
		FreeDTO detail = freeService.detail(reBno);

		mv.addObject("modify", detail);

		// 세션
//			if (detail.getUser_name().equals(session.getAttribute("name"))) {
//				//modify ModelAndView에 DTO 보이게하기
//			} else {
//				mv.setViewName("error?code=3");
//			}
//			
		
		String whatBoard = "free";

		mv.addObject("whatBoard", whatBoard);
		return mv;
	}

	// 수정버튼 실행
	@RequestMapping(value = "free/modifyAction.do")
	public ModelAndView modifyAction(HttpServletRequest request) throws Exception {
//				HttpSession session = request.getSession();
		String board_no = request.getParameter("board_no");
		ModelAndView mv = new ModelAndView("redirect:freeDetail.do?board_no=" + board_no);

		// 세션
//				if (session.getAttribute("name") != null && session.getAttribute("id") != null && session.getAttribute("board3_no") != null ) {
		mv.setViewName("redirect:freeDetail.do?board_no=" + board_no);

		String title = request.getParameter("title");
		String content = request.getParameter("content");

		FreeDTO dto = new FreeDTO();
		dto.setBoard_title(title);
		dto.setBoard_content(content);
		dto.setBoard_no(Util.checkInt(board_no));
//					dto.setUser_name((String) session.getAttribute("id"));
		freeService.modifyAction(dto);

//				}	else {
//					mv.setViewName("error?code=5");
//				}
		
		String whatBoard = "free";

		mv.addObject("whatBoard", whatBoard);

		return mv;
	}
}
