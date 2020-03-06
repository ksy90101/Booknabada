package com.booknabada.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.booknabada.dao.EventDAO;
import com.booknabada.dto.EventDTO;

@Service("eventService")
public class EventServiceImpl implements EventService{
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="eventDAO")
	private EventDAO eventDAO;


	@Override
	public List<EventDTO> eboard(int page) throws Exception {
		return eventDAO.eboard(page);
	}


	@Override
	public void writeAction(EventDTO dto) throws Exception {
		eventDAO.writeAction(dto);		
	}


	@Override
	public EventDTO detail(int reBno) throws Exception {
		return eventDAO.detail(reBno);
	}


	@Override
	public void countUp(int reBno) throws Exception {
		eventDAO.countUp(reBno);
	}


	@Override
	public void eventDelete(EventDTO dto) throws Exception {
		eventDAO.eventDelete(dto);
		
	}


	@Override
	public void eventModify(EventDTO detail) throws Exception {
		eventDAO.eventModify(detail);
	}


	@Override
	public List<EventDTO> searchboard(int page) throws Exception {
		return eventDAO.searchboard(page);
	}


}
