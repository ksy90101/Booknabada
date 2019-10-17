package com.booknabada.controller;

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

}