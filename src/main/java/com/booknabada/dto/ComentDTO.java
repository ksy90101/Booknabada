package com.booknabada.dto;

public class ComentDTO {
	private int coment_no, board_no;
	private String coment_content, user_name, coment_date;
	
	public int getComent_no() {
		return coment_no;
	}
	public void setComent_no(int coment_no) {
		this.coment_no = coment_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getComent_content() {
		return coment_content;
	}
	public void setComent_content(String coment_content) {
		this.coment_content = coment_content;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getComent_date() {
		return coment_date;
	}
	public void setComent_date(String coment_date) {
		this.coment_date = coment_date;
	}
	

}
