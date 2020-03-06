package com.booknabada.dto;

public class FaqDTO {
	int faq_category, faq_no;
	String faq_answer, faq_qustion;

	public int getFaq_no() {
		return faq_no;
	}
	
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public int getFaq_category() {
		return faq_category;
	}

	public void setFaq_category(int faq_category) {
		this.faq_category = faq_category;
	}

	public String getFaq_answer() {
		return faq_answer;
	}

	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}

	public String getFaq_qustion() {
		return faq_qustion;
	}

	public void setFaq_qustion(String faq_qustion) {
		this.faq_qustion = faq_qustion;
	}

	
}
