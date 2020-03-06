package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.BookDTO;
import com.booknabada.dto.LikeDTO;
import com.booknabada.dto.LoginDTO;
import com.common.dao.AbstractDAO;

@Repository("myDAO")
public class MyDAO extends AbstractDAO{
	
	public int getPoint(String id) {
		return (int) selectOne("my.getPoint", id);
	}

	public LoginDTO pabookInfo(int user_no) {
		return (LoginDTO) selectOne("my.pabookInfo", user_no);
	}

	@SuppressWarnings("unchecked")
	public List<BookDTO> bookInfo(int user_no) {
		return selectList("my.bookInfo",user_no);
	}

	public void lickAction(LikeDTO dto) {
		insert("my.likeAction",dto);
	}

	public int getLikeCheck(LikeDTO dto) {
		return (int) selectOne("my.getLikeCheck",dto);
	}

	public void likeCancel(LikeDTO dto) {
		delete("my.likeCancel",dto);
	}

	public LoginDTO modifyuser(int user_no) {
		return (LoginDTO) selectOne("my.modifyuser", user_no);
	}

	public void modifyuserAction(LoginDTO dto) {
		update("my.modifyuserAction", dto);
	}

	public int likeCnt(String like_to) {
		return (int) selectOne("my.likeCnt",like_to);
	}

}
