package com.booknabada.dto;

public class NoticeDTO {
	private int board_no, cate_no, board_count, user_no, totalCount;
	private String board_title, board_content, board_date, user_name, board_picture;
	
	private int coment_no;
	private String coment_content, coment_date;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getBoard_picture() {
		return board_picture;
	}
	public void setBoard_picture(String board_picture) {
		this.board_picture = board_picture;
	}
	public int getComent_no() {
		return coment_no;
	}
	public void setComent_no(int coment_no) {
		this.coment_no = coment_no;
	}
	public String getComent_content() {
		return coment_content;
	}
	public void setComent_content(String coment_content) {
		this.coment_content = coment_content;
	}
	public String getComent_date() {
		return coment_date;
	}
	public void setComent_date(String coment_date) {
		this.coment_date = coment_date;
	}
	

}
