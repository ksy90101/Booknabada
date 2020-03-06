package com.booknabada.dto;

public class StoreDTO {
	private int store_no;
	private String store_name, store_admin, store_phone;
	
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_admin() {
		return store_admin;
	}
	public void setStore_admin(String store_admin) {
		this.store_admin = store_admin;
	}
	public String getStore_phone() {
		return store_phone;
	}
	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}
}