package com.booknabada.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.QnaDTO;
import com.booknabada.service.QnaService;
import com.booknabada.util.Util;
import com.common.common.CommandMap;

@Controller
public class QnaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	//게시판 목록
	@RequestMapping(value="qna/qnaBoard.do")
	public ModelAndView qna(HttpServletRequest request, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("qna/qnaBoard");

		int page = 1;
		if (request.getParameter("page") != null) {
			page = Util.checkInt(request.getParameter("page"));
		}
		if (commandMap.get("page") != null) {
			page = Util.checkInt((String)commandMap.get("page"));
		}
		
		List<QnaDTO> board = qnaService.board(((page - 1) * 10));
		
		//DB에서 온 데이터 jsp에 뿌리기
		mv.addObject("board", board);
		//페이지
		mv.addObject("page", page);
		//총글수
		mv.addObject("totalCount", board.get(0).getTotalCount());
//		
		String whatBoard = "qna";

		mv.addObject("whatBoard", whatBoard);
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
//		List<QnaDTO> coment = qnaService.coment(reBno);
		
		//DB에서 온 데이터 jsp에 뿌리기
		mv.addObject("qnaDetail", qnaDetail);	
//		mv.addObject("coment", coment);
		String whatBoard = "qna";

		mv.addObject("whatBoard", whatBoard);
		return mv;
	}
	
	//글쓰기보기
	@RequestMapping(value="qna/qnaWrite.do")
	public ModelAndView qnaWrite(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("qna/qnaWrite");
		
		//Write.do로 가기
		
		String whatBoard = "qna";

		mv.addObject("whatBoard", whatBoard);
		return mv;
		
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
		if (file.getOriginalFilename() != null) {
			//지금 시간 가져오기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = sdf.format(new Date());
			//시간+파일이름 합치기
			String upFileName = today + file.getOriginalFilename();
			//파일 업로드 경로
			String path = request.getSession().getServletContext().getRealPath("");
			System.out.println("리얼경로 " + path);
			File f = new File(path + "upimg/" + upFileName); //준비
			file.transferTo(f); //실제 파일 전송
			
			dto.setBoard_picture(upFileName);
		}
		
		//데이터베이스 쓰기 실행
		qnaService.qnaWriteAction(dto);
		String whatBoard = "qna";

		mv.addObject("whatBoard", whatBoard);
		
		return mv;
	}
	
	//글삭제 실행
	@RequestMapping(value="qna/qnaDelete.do")
	public ModelAndView detailDetele(HttpServletRequest request) throws Exception {
//		HttpSession session = request.getSession();
			
		//보드로 되돌아가기 1번
		ModelAndView mv = new ModelAndView("redirect:qnaBoard.do");

		//세션추가
//		if (session.getAttribute("name") != null && 
//			session.getAttribute("id") != null && 
//			session.getAttribute("board3_no") != null) {
			String board_no = request.getParameter("board_no");
				
			//숫자를 체크
			int detail_no = Util.checkInt(board_no);
				
			QnaDTO dto = new QnaDTO();
			dto.setBoard_no(detail_no);
//			dto.setUser_name((String)session.getAttribute("id"));
				
			//DB쪽으로 보내기
			qnaService.detailDelete(dto);
			
//		} else {
//			mv.setViewName("error?code=4");
//		}
			
			String whatBoard = "qna";

			mv.addObject("whatBoard", whatBoard);
			return mv;
		}
	
	//수정페이지 이동
	@RequestMapping(value="qna/qnaModify.do")
	public ModelAndView detailModify(HttpServletRequest request) throws Exception {
//		HttpSession session = request.getSession();
			
		//수정버튼 누르면 수정페이지로 이동
		ModelAndView mv = new ModelAndView("qna/qnaModify");
		
		String board_no = request.getParameter("board_no");
			
		//숫자체크 후 게시판번호 담기
		int reBno = Util.checkInt(board_no);
			
		//자기글 불러와서 DTO에 담기
		QnaDTO detail = qnaService.detail(reBno);
			
		mv.addObject("modify", detail);
		
		//세션
//		if (detail.getUser_name().equals(session.getAttribute("name"))) {
//			//modify ModelAndView에 DTO 보이게하기
//		} else {
//			mv.setViewName("error?code=3");
//		}
//		
		String whatBoard = "qna";

		mv.addObject("whatBoard", whatBoard);
		return mv;
	}
	
	//수정버튼 실행
		@RequestMapping(value="qna/modifyAction.do")
		public ModelAndView modifyAction(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception{
//			HttpSession session = request.getSession();
			String board_no = request.getParameter("board_no");
			ModelAndView mv = new ModelAndView("redirect:qnaDetail.do?board_no=" + board_no);
			
			//세션
//			if (session.getAttribute("name") != null && session.getAttribute("id") != null && session.getAttribute("board3_no") != null ) {
				mv.setViewName("redirect:qnaDetail.do?board_no=" + board_no);
				
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				
				//엔터키 적용
				content = content.replaceAll("\r\n", "\n");
				content = content.replaceAll("\n", "<br>");
				
				QnaDTO dto = new QnaDTO();
				dto.setBoard_title(title);
				dto.setBoard_content(content);
				dto.setBoard_no(Util.checkInt(board_no));
//				dto.setUser_name((String) session.getAttribute("id"));
				
				//사진업로드
				if (file.getOriginalFilename() == file.getOriginalFilename()) {
					//지금 시간 가져오기
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String today = sdf.format(new Date());
					//시간+파일이름 합치기
					String upFileName = today + file.getOriginalFilename();
					//파일 업로드 경로
					String path = request.getSession().getServletContext().getRealPath("");
					//System.out.println("리얼경로 " + path);
					File f = new File(path + "upimg/" + upFileName); //준비
					file.transferTo(f); //실제 파일 전송
					
					dto.setBoard_picture(upFileName);
				}
				
				//데이터베이스 쓰기 실행
				qnaService.modifyAction(dto);
				
//			}	else {
//				mv.setViewName("error?code=5");
//			}
			
			return mv;
		}
}
