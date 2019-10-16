package com.booknabada.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.MyDAO;

@Service("myService")
public class MyServiceImpl implements MyService{
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="myDAO")
	private MyDAO myDAO;


	@Override
	public int getPoint(String id) throws Exception {
		return myDAO.getPoint(id);
	}

}
