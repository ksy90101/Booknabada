package com.booknabada.dao;

import org.springframework.stereotype.Repository;

import com.common.dao.AbstractDAO;

@Repository("myDAO")
public class MyDAO extends AbstractDAO{
	
	public int getPoint(String id) {
		return (int) selectOne("my.getPoint", id);
	}

}
