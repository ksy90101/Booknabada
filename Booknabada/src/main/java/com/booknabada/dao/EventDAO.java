package com.booknabada.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.booknabada.dto.EventDTO;
import com.common.dao.AbstractDAO;

@Repository("eventDAO")
public class EventDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<EventDTO> eboard(int page) {
		return selectList("event.eboard", page);
	}

	public void writeAction(EventDTO dto) {
		insert("event.writeAction",dto);
	}

	public EventDTO detail(int reBno) {
		return (EventDTO) selectOne("event.detail", reBno);
	}

	public void countUp(int reBno) {
		update("event.countUp", reBno);
	}

	public void eventDelete(EventDTO dto) {
		delete("event.eventDelete",dto);		
	}

	public void eventModify(EventDTO detail) {
		update("event.eventModify",detail);		
	}


}
