package com.booknabada.service;

import java.util.List;

import com.booknabada.dto.EventDTO;

public interface EventService {

	List<EventDTO> eboard() throws Exception;

	void writeAction(EventDTO dto) throws Exception;

	EventDTO detail(int reBno) throws Exception;

	void countUp(int reBno) throws Exception;

	void eventDelete(EventDTO dto) throws Exception;


}
