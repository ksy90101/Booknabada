package com.booknabada.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.MyDAO;
import com.booknabada.dto.BookDTO;
import com.booknabada.dto.LikeDTO;
import com.booknabada.dto.LoginDTO;

@Service("myService")
public class MyServiceImpl implements MyService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myDAO")
	private MyDAO myDAO;
	
	// 포인트 가져오기
	@Override
	public int getPoint(String id) throws Exception {
		return myDAO.getPoint(id);
	}	
	
	//파북이 페이지에서 파북이정보 가져오기
	@Override
	public LoginDTO pabookInfo(int user_no) throws Exception {
		return myDAO.pabookInfo(user_no);
	}

	//파북이 페이지에서 파북이 책정보 가져오기
	@Override
	public List<BookDTO> bookInfo(int user_no) throws Exception {
		return myDAO.bookInfo(user_no);
	}

	@Override
	public void likeAction(LikeDTO dto) throws Exception {
		myDAO.lickAction(dto);		
	}
	
	//좋아요를 눌렀었는지 확인하기
	@Override
	public int getLikeCheck(LikeDTO dto) throws Exception {
		return myDAO.getLikeCheck(dto);
	}

	@Override
	public void likeCancel(LikeDTO dto) throws Exception {
		myDAO.likeCancel(dto);
	}

	// 회원정보 변경
	@Override
	public List<LoginDTO> modifyuser(int user_no) throws Exception {
		return myDAO.modifyuser(user_no);
	}


}
