package com.booknabada.service;

import com.booknabada.dto.LoginDTO;

public interface MailService {
	public boolean send(String subject, String text, String from, String to);

	public int infoCheck(LoginDTO dto) throws Exception;

	public boolean sendpw(String subject, String text, String from, String to);

	public void changepw(LoginDTO dto) throws Exception;

}