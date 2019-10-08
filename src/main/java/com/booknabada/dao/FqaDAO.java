package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.FqaDTO;
import com.common.dao.AbstractDAO;

@Repository("fqaDAO")
public class FqaDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<FqaDTO> board() {
		
		return selectList("sample.board");
	}

}
