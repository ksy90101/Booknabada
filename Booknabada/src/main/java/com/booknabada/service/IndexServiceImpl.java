package com.booknabada.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.IndexDAO;
import com.booknabada.dto.BookDTO;
import com.booknabada.dto.LoginDTO;

@Service("indexService")
public class IndexServiceImpl implements IndexService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="indexDAO")
	private IndexDAO indexDAO;

	@Override
	public List<BookDTO> lovebook() throws Exception {
		return indexDAO.lovebook();
	}

	@Override
	public List<LoginDTO> loveuser() throws Exception {
		return indexDAO.loveuser();
	}

	@Override
	public List<BookDTO> currentbook() throws Exception {
		return indexDAO.currentbook();
	}

}
