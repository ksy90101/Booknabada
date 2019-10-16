package com.booknabada.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.dto.OrderDTO;
import com.booknabada.service.OrderService;

@Controller
public class OrderController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	//주문화면
	@RequestMapping(value="order/order.do")
	public ModelAndView order(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("order/order");
		
		int page = 1;
		
		//해당 bno -> DB로 보내서 해당 글 가져오기(DTO)
		List<OrderDTO> board = orderService.orderbook(((page - 1) * 10));

		mv.addObject("order", board);	
		
		return mv;
	}
	
	//결제페이지
	@RequestMapping(value="order/orderPay.do")
	public ModelAndView orderPay(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("order/orderPay");
		
		
		//이전페이지 태그값
		Map<Object, String> orderData = new HashMap<Object, String>();
		orderData.put("name", request.getParameter("name"));
		
		orderData.put("locaDetail", request.getParameter("locaA")+ request.getParameter("locaB") + request.getParameter("locaC"));
		orderData.put("phone", request.getParameter("phoneA") + request.getParameter("phoneB") + request.getParameter("phoneC"));
		
		if (request.getParameter("store") != "선택") {
			orderData.put("store", request.getParameter("store"));
		}
		
		orderData.put("note", request.getParameter("note"));
		
		
		String totalPrice = request.getParameter("totalPrice");
		String totalBook = request.getParameter("totalBook");
		
		Iterator<Map.Entry<Object, String>> entries = orderData.entrySet().iterator();
		while (entries.hasNext()) {
		    Map.Entry<Object, String> entry = entries.next();
		    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
		}
		
		
		//추가하기
		mv.addObject("totalBook",totalBook);
		mv.addObject("totalPrice", totalPrice);
		mv.addObject(orderData);
		
		return mv;
	}
	
	//주문완료
		@RequestMapping(value="order/orderFinish.do")
		public ModelAndView orderFinish() throws Exception{
			ModelAndView mv = new ModelAndView("order/orderFinish");
		
			return mv;
		}
}
	
	