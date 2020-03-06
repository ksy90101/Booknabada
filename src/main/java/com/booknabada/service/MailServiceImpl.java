package com.booknabada.service;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.booknabada.dao.MailDAO;
import com.booknabada.dto.LoginDTO;

@Service("mailService")
public class MailServiceImpl implements MailService {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private JavaMailSender javaMailSender;
	
	@Resource(name = "mailDAO")
	private MailDAO mailDAO;

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	@Override
	public boolean send(String subject, String text, String from, String to) {
		MimeMessage message = javaMailSender.createMimeMessage();
		// 예외처리
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject); // 제목
			helper.setText(text, true); // 내용
			helper.setFrom(from); // 보내는 사람
			helper.setTo(to); // 받는 사람
			javaMailSender.send(message);

			return true;

		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public int infoCheck(LoginDTO dto) throws Exception {
		return mailDAO.infoCheck(dto);
	}

	@Override
	public boolean sendpw(String subject, String text, String from, String to) {
		MimeMessage message = javaMailSender.createMimeMessage();
		// 예외처리
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject); // 제목
			helper.setText(text, true); // 내용
			helper.setFrom(from); // 보내는 사람
			helper.setTo(to); // 받는 사람
			javaMailSender.send(message);

			return true;

		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void changepw(LoginDTO dto) throws Exception {
		mailDAO.changepw(dto);
	}
}