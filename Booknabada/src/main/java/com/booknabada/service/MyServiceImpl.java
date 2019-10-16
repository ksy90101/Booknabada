package com.booknabada.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.MyDAO;
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
	
	//회원정보 변경
	@Override
	public LoginDTO detail(int reBno) throws Exception {
		return myDAO.detail(reBno);
	}


}
