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

import com.booknabada.dto.ComentDTO;
import com.booknabada.dto.NoticeDTO;
import com.booknabada.service.NoticeService;
import com.booknabada.util.Util;
import com.common.common.CommandMap;

@Controller
public class NoticeController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "noticeService")
	private NoticeService noticeService;

	// 게시판 목록
	@RequestMapping(value = "notice/noticeBoard.do")
	public ModelAndView noticeBoard(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("notice/noticeBoard");

		int page = 1;
		if (request.getParameter("page") != null) {
			page = Util.checkInt(request.getParameter("page"));
		}
		if (commandMap.get("page") != null) {
			page = Util.checkInt((String) commandMap.get("page"));
		}

		List<NoticeDTO> board = noticeService.board(((page - 1) * 10));

		// DB에서 온 데이터 jsp에 뿌리기
		mv.addObject("board", board);
		// 페이지
		mv.addObject("page", page);
		// 총글수
		mv.addObject("totalCount", board.get(0).getTotalCount());

		String whatBoard = "notice";
		mv.addObject("whatBoard", whatBoard);

		return mv;

	}

	// 상세보기
	@RequestMapping(value = "notice/noticeDetail.do")
	public ModelAndView noticeDetail(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("notice/noticeDetail");

		String bno = request.getParameter("board_no");
		int reBno = Util.checkInt(bno);

		noticeService.countUp(reBno);

		NoticeDTO noticeDetail = noticeService.detail(reBno);
		List<ComentDTO> coment = noticeService.coment(reBno);
		System.out.println(reBno);
		String whatBoard = "notice";
		mv.addObject("whatBoard", whatBoard);
		mv.addObject("noticeDetail", noticeDetail);
		mv.addObject("coment", coment);
		return mv;
	}

	// 글쓰기보기
	@RequestMapping(value = "notice/noticeWrite.do")
	public ModelAndView noticeWrite(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String whatBoard = "notice";

		// 로그인 한 사람만 보이게...
		if (session.getAttribute("id") != null && session.getAttribute("name") != null) {
			// Write.do로 가기
			mv.setViewName("notice/noticeWrite");
			mv.addObject("whatBoard", whatBoard);
			return mv;
		} else {
			mv.setViewName("redirect:index.do");
			return mv;
		}
		//
	}
	// 글쓰기 실행

	@RequestMapping(value = "notice/noticeWriteAction.do")
	public ModelAndView writeAction(HttpServletRequest request, @RequestParam("file") MultipartFile file)
			throws Exception {

		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView("redirect:noticeBoard.do");
		if (session.getAttribute("name") != null && session.getAttribute("id") != null) {

			// 작성된값 가져가기
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			// 엔터키 적용
			content = content.replaceAll("\r\n", "\n");
			content = content.replaceAll("\n", "<br>");

			// 데이터베이스로 위 데이터 보내기
			NoticeDTO dto = new NoticeDTO();

			dto.setCate_no(1);
			dto.setBoard_title(title);
			dto.setBoard_content(content);
			dto.setUser_name((String) session.getAttribute("id"));

			// 사진업로드
			if (file.getOriginalFilename() != null) {
				// 지금 시간 가져오기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String today = sdf.format(new Date());
				// 시간+파일이름 합치기
				String upFileName = today + file.getOriginalFilename();
				// 파일 업로드 경로
				String path = request.getSession().getServletContext().getRealPath("");
				// System.out.println("리얼경로 " + path);
				File f = new File(path + "upimg/" + upFileName); // 준비
				file.transferTo(f); // 실제 파일 전송

				dto.setBoard_picture(upFileName);
			}

			// 데이터베이스 쓰기 실행

			noticeService.noticeWriteAction(dto);
		} else {
			mv.setViewName("caution");
		}

		return mv;
	}

	// 글삭제 실행

	@RequestMapping(value = "notice/detailDelete.do")
	public ModelAndView detailDetele(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView("redirect:noticeBoard.do");

		if (session.getAttribute("name") != null && session.getAttribute("id") != null) {

			String board_no = request.getParameter("board_no");

			int detail_no = Util.checkInt(board_no);

			NoticeDTO dto = new NoticeDTO();
			dto.setBoard_no(detail_no);
			dto.setUser_name((String) session.getAttribute("id"));

			noticeService.detailDelete(dto);

		} else {
			mv.setViewName("caution");
		}

		return mv;
	}

	// 수정페이지 이동
	@RequestMapping(value = "notice/noticeModify.do")
	public ModelAndView noticeModify(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView("notice/noticeModify");

		String board_no = request.getParameter("board_no");

		int reBno = Util.checkInt(board_no);

		NoticeDTO detail = noticeService.detail(reBno);

//			mv.addObject("modify", detail);
		if (detail.getUser_name().equals(session.getAttribute("name"))) {
			mv.addObject("modify", detail);
			// modify ModelAndView에 DTO 보이게하기
		} else {
			mv.setViewName("caution");
			// mv.setViewName("error?code=3");
		}
		String whatBoard = "notice";
		mv.addObject("whatBoard", whatBoard);
		return mv;
	}

	// 수정버튼 실행
	@RequestMapping(value = "notice/modifyAction.do")
	public ModelAndView modifyAction(HttpServletRequest request, @RequestParam("file") MultipartFile file)
			throws Exception {
		HttpSession session = request.getSession();
		String board_no = request.getParameter("board_no");
		ModelAndView mv = new ModelAndView("redirect:noticeDetail.do?board_no=" + board_no);

		// 세션
		if (session.getAttribute("name") != null && session.getAttribute("id") != null) {

			mv.setViewName("redirect:noticeDetail.do?board_no=" + board_no);

			String title = request.getParameter("title");
			String content = request.getParameter("content");

			// 엔터키 적용
			content = content.replaceAll("\r\n", "\n");
			content = content.replaceAll("\n", "<br>");

			NoticeDTO dto = new NoticeDTO();
			dto.setBoard_title(title);
			dto.setBoard_content(content);
			dto.setBoard_no(Util.checkInt(board_no));
			dto.setUser_name((String) session.getAttribute("id"));

			// 사진업로드
			if (!file.isEmpty()) {
				// 지금 시간 가져오기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String today = sdf.format(new Date());
				// 시간+파일이름 합치기
				String upFileName = today + file.getOriginalFilename();
				// 파일 업로드 경로
				String path = request.getSession().getServletContext().getRealPath("");
				// System.out.println("리얼경로 " + path);
				File f = new File(path + "upimg/" + upFileName); // 준비
				file.transferTo(f); // 실제 파일 전송

				dto.setBoard_picture(upFileName);
			}
			// 데이터베이스 쓰기 실행
			noticeService.modifyAction(dto);

		} else {
			mv.setViewName("caution");
		}

		return mv;
	}

	// 댓글 작성
	@RequestMapping(value = "notice/comentAction.do")
	public ModelAndView comentAction(HttpServletRequest request) throws Exception {
		// 세션가져오기
		HttpSession session = request.getSession();

		String board_no = request.getParameter("board_no");
		ModelAndView mv = new ModelAndView("redirect:noticeDetail.do?board_no=" + board_no);
		String content = request.getParameter("coment_content");

		ComentDTO dto = new ComentDTO();
		dto.setBoard_no(Util.checkInt(board_no));
		dto.setComent_content(content);
		dto.setUser_name((String) session.getAttribute("id"));

		noticeService.comentAction(dto);

		return mv;
	}

	// 댓글 삭제
	@RequestMapping(value = "notice/comentDelete.do")
	public ModelAndView comentDelete(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		String board_no = request.getParameter("board_no");
		ModelAndView mv = new ModelAndView("redirect:noticeDetail.do?board_no=" + board_no);
		// 숫자인지 체크
		int coment_no = Util.checkInt(request.getParameter("coment_no"));

		ComentDTO dto = new ComentDTO();
		dto.setComent_no(coment_no);
		dto.setUser_name((String) session.getAttribute("id"));

		noticeService.comentDelete(dto);

		return mv;
	}
}
