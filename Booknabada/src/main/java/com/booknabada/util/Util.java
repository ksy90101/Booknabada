package com.booknabada.util;

import javax.servlet.http.HttpServletRequest;

public class Util {
	
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
