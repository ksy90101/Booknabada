package com.booknabada.util;

import javax.servlet.http.HttpServletRequest;

public class Util {
	
	//ip값 가져오기
	public static String getIp(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		
		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	//id체크하기
	public static int checkInt(String str) {
		
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < str.length(); i++) {
			if (Character.isDigit(str.charAt(i))) {
				sb.append(str.charAt(i));
			}
		}
		return Integer.parseInt(sb.toString());
		
	}

	
	
}
