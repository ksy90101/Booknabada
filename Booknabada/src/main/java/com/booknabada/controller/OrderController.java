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
import com.booknabada.dto.QnaDTO;
import com.booknabada.service.OrderService;
import com.booknabada.util.Util;

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
		int store = 1;
		
		//해당 bno -> DB로 보내서 해당 글 가져오기(DTO)
		List<OrderDTO> orderBook = orderService.orderbook(((page - 1) * 10));
		List<OrderDTO> storeList = orderService.storeList(store);
		
		mv.addObject("storelist", storeList);
		mv.addObject("orderBook", orderBook);	
		
		return mv;
	}
	
	//결제페이지
	@RequestMapping(value="order/orderPay.do")
	public ModelAndView orderPay(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("order/orderPay");
		
		
		//이전페이지 태그값 맵에 넣기
		Map<Object, String> orderData = new HashMap<Object, String>();
		orderData.put("name", request.getParameter("name"));
		
		//배송지체크
		//System.out.println("배송지체크 " + request.getParameter("loc_check"));
			orderData.put("loca_check", request.getParameter("loca_check"));
			
		if (request.getParameter("loc_check").equals("0") || request.getParameter("loc_check").equals("null") ) {
			orderData.put("locaA", request.getParameter("locaA"));
			orderData.put("locaB", request.getParameter("locaB"));
			orderData.put("locaC", request.getParameter("locaC"));
		}
		if (request.getParameter("loc_check").equals("1")) {
			orderData.put("store", request.getParameter("store"));
		}
		//폰넘버 합치기
		orderData.put("phone", request.getParameter("phoneA") + request.getParameter("phoneB") + request.getParameter("phoneC"));
		
		//요구사항 조건
		if (request.getParameter("note").isEmpty()) {
			orderData.put("note", "아무도 모르게 가져다 주세요");
		} else {
			orderData.put("note", request.getParameter("note"));
		}
		
		String totalPrice = request.getParameter("totalPrice");
		String totalBook = request.getParameter("totalBook");
		String totalBook1 = request.getParameter("totalBook1");
		
		//값 확인
		Iterator<Map.Entry<Object, String>> entries = orderData.entrySet().iterator();
		while (entries.hasNext()) {
		    Map.Entry<Object, String> entry = entries.next();
		    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
		}
		
		
		//추가하기
		mv.addObject("totalBook",totalBook);
		mv.addObject("totalBook1",totalBook1);
		mv.addObject("totalPrice", totalPrice);
		mv.addObject("orderData", orderData);
		
		return mv;
	}
	
	//주문완료
		@RequestMapping(value="order/orderFinish.do")
		public ModelAndView orderFinish(HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView("order/orderFinish");
			
			
			//order.do에서 넘어온 값 담기
			Map<Object, String> orderData = new HashMap<Object, String>();
			orderData.put("name", request.getParameter("name"));
			orderData.put("locaA", request.getParameter("locaA"));
			orderData.put("locaB", request.getParameter("locaB"));
			orderData.put("locaC", request.getParameter("locaC"));
			orderData.put("store", request.getParameter("store"));
			orderData.put("phone", request.getParameter("phone"));
			orderData.put("note", request.getParameter("note"));
			
			String totalPrice = request.getParameter("totalPrice");
			String totalBook = request.getParameter("totalBook");
			String totalBook1 = request.getParameter("totalBook1");
			
			//order.do 값 출력
//			Iterator<Map.Entry<Object, String>> entries = orderData.entrySet().iterator();
//			while (entries.hasNext()) {
//			    Map.Entry<Object, String> entry = entries.next();
//			    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
//			}
			
			//int usePoint = Util.checkInt(request.getParameter("usePoint"));
			
			//결제값 담기
			Map<Object, String> payData = new HashMap<Object, String>();
			//결제선택 체크
			//System.out.println("결제선택 " + request.getParameter("what"));
				payData.put("payChoice", request.getParameter("what"));
			if (request.getParameter("what").equals("card")) {
				payData.put("cardNo", request.getParameter("cardNo"));
				payData.put("cardYear", request.getParameter("cardYear"));
				payData.put("cardMonth", request.getParameter("cardMonth"));
				payData.put("cardUser", request.getParameter("cardUser"));
				payData.put("cardCvv", request.getParameter("cardCvv"));
			} if (request.getParameter("what").equals("bank")) {
				payData.put("bankUser", request.getParameter("bankUser"));
				payData.put("bankName", request.getParameter("bankName"));
				payData.put("bankNo", request.getParameter("bankNo"));
			} if (request.getParameter("what").equals("phone")) {
				payData.put("phoneUser", request.getParameter("phoneUser"));
				payData.put("phoneNo", request.getParameter("payPhoneA") + request.getParameter("payPhoneB") + request.getParameter("payPhoneC"));
			}
			
			//Map값 확인
			Iterator<Map.Entry<Object, String>> entries2 = payData.entrySet().iterator();
			while (entries2.hasNext()) {
			    Map.Entry<Object, String> entry = entries2.next();
			    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
			}
			
			mv.addObject("totalBook",totalBook);
			mv.addObject("totalBook1",totalBook1);
			mv.addObject("totalPrice", totalPrice);
			mv.addObject("orderData", orderData);
			mv.addObject("payData", payData);
			
			return mv;
		}
}
	
	