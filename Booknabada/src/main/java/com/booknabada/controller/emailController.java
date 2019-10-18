package com.booknabada.controller;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booknabada.dao.LoginDAO;
import com.booknabada.dto.LoginDTO;
import com.booknabada.service.MailService;

@Controller
public class emailController {

	@Resource(name="mailService")
	private MailService mailService;

	@RequestMapping(value = "login/createEmailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public boolean createEmailCheck(@RequestParam String userEmail, @RequestParam int random,
			HttpServletRequest request, String sendEmailId) {
		
		sendEmailId = "ksy90101@naver.com";
		
		
		// 이메일 인증
		int ran = new Random().nextInt(900000) + 100000; // 난수생성

		HttpSession session = request.getSession(true); // 세션 부르기

		String authCode = String.valueOf(ran); // 랜덤값을 String으로 형 변환하여 atuhCode에 저장
		
		session.setAttribute("authCode", authCode); // authCode를 세션에 저장
		session.setAttribute("random", random); // 랜덤값을 세션에 저장

		String subject = "회원가입 인증 코드 발급 안내 입니다."; // 제목
		StringBuilder sb = new StringBuilder(); // 내용
		sb.append("귀하의 인증 코드는 " + authCode + "입니다.");

		return mailService.send(subject, sb.toString(), sendEmailId, userEmail);
	}

	
	@RequestMapping(value = "login/emailAuth.do", method = RequestMethod.GET)
	//@RequestParam("authCode") String authCode
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam("random") String random, HttpSession session, HttpServletRequest request) {
		String authCode = request.getParameter("authCode");
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalRandom = Integer.toString((int) session.getAttribute("random"));
		if (originalJoinCode.equals(authCode) && originalRandom.equals(random)) {
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
	}
	
	//비밀번호 찾을 때 아이디,이름,메일 받고 정보 맞는지 확인해주기!
	@RequestMapping(value = "login/infoCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public boolean infoCheck(HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		LoginDTO dto = new LoginDTO();
		dto.setUser_id(id);
		dto.setUser_name(name);
		dto.setUser_email(email);
		
		//System.out.println(dto.getUser_id());
		
		int num = mailService.infoCheck(dto);
		
		boolean chk = false;
		if(num==1) {
			chk = true;
		}
		//System.out.println(chk);
		
		return chk;
	}
	
	
	@RequestMapping(value = "login/findpwCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public boolean findpwCheck(@RequestParam String userEmail, @RequestParam int pageNum,
			HttpServletRequest request, String sendEmailId) throws Exception {
		
		sendEmailId = "heeeeejin2@naver.com";
		
		System.out.println("아이디는 "+request.	getParameter("id"));
		
		// 이메일 인증, 비밀번호 변경
		int ran = new Random().nextInt(900000) + 100000; // 난수생성

		HttpSession session = request.getSession(true); // 세션 부르기
		
		String newpw = String.valueOf(ran); 
		// 랜덤값을 String으로 형 변환하여 newpw에 저장, 새로운 비밀번호가 될거임!
		
		//session.setAttribute("authCode", authCode); // authCode를 세션에 저장
		session.setAttribute("pageNum", pageNum); // 페이지 넘버값을 세션에 저장
		
		LoginDTO dto = new LoginDTO();
		dto.setUser_id(request.	getParameter("id"));
		dto.setUser_pw(newpw);
		mailService.changepw(dto);
		System.out.println(dto.getUser_pw());

		String subject = "새로운 비밀번호 안내 입니다."; // 제목
		StringBuilder sb = new StringBuilder(); // 내용
		sb.append("귀하의 새로운 비밀번호는 " + newpw + "입니다.<br>	");
		sb.append("가까운 시일 내에 변경 부탁드립니다.");

		return mailService.sendpw(subject, sb.toString(), sendEmailId, userEmail);
	}
	
	@RequestMapping(value = "login/findpwAuth.do", method = RequestMethod.GET)
	//@RequestParam("authCode") String authCode
	@ResponseBody
	public ResponseEntity<String> findpwAuth(@RequestParam("pageNum") String pageNum, HttpSession session, HttpServletRequest request) {
		String authCode = request.getParameter("authCode");
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalpageNum = Integer.toString((int) session.getAttribute("pageNum"));
		if (originalJoinCode.equals(authCode) && originalpageNum.equals(pageNum)) {
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
	}

	
	

}