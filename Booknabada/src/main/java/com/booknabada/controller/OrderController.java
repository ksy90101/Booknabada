package com.booknabada.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.booknabada.dto.BookDTO;
import com.booknabada.dto.OrderDTO;
import com.booknabada.dto.QnaDTO;
import com.booknabada.dto.StoreDTO;
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
		int store = 1;
		int book_no = Util.checkInt(request.getParameter("book_no"));
		
		//해당 book_no -> DB로 보내서 해당 글 가져오기(DTO)
		List<BookDTO> orderBook = orderService.orderbook("book_no");
		List<StoreDTO> storeList = orderService.storeList(store);
		
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
		//System.out.println("배송지체크 " + request.getParameter("loca_check"));
		if (request.getParameter("loca_check").equals("null")) {
			orderData.put("loca_check", "0");
		} else {
			orderData.put("loca_check", request.getParameter("loca_check"));
		}
		if (orderData.get("loca_check").equals("0")) {
			orderData.put("locaA", request.getParameter("locaA"));
			orderData.put("locaB", request.getParameter("locaB"));
			orderData.put("locaC", request.getParameter("locaC"));
		}
		if (orderData.get("loca_check").equals("1")) {
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
		String totalPrice2 = request.getParameter("totalPrice2");
		String totalBook = request.getParameter("totalBook");
		String totalBook_point = request.getParameter("totalBook_point");
		
		//값 확인
//		Iterator<Map.Entry<Object, String>> entries = orderData.entrySet().iterator();
//		while (entries.hasNext()) {
//		    Map.Entry<Object, String> entry = entries.next();
//		    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
//		}
		
		
		//추가하기
		mv.addObject("totalBook",totalBook);
		mv.addObject("totalBook_point",totalBook_point);
		mv.addObject("totalPrice", totalPrice);
		mv.addObject("totalPrice2", totalPrice2);
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
			orderData.put("loca_check", request.getParameter("loca_check"));
			
			if (orderData.get("loca_check").equals("0")) {
				orderData.put("locaA", request.getParameter("locaA"));
				orderData.put("locaB", request.getParameter("locaB"));
				orderData.put("locaC", request.getParameter("locaC"));
			}
			if (orderData.get("loca_check").equals("1")) {
				orderData.put("store", request.getParameter("store"));
			}
			
			orderData.put("phone", request.getParameter("phone"));
			orderData.put("note", request.getParameter("note"));
			
			
			int phone = Util.checkInt(orderData.get("phone"));
			int totalPrice = Util.checkInt(request.getParameter("totalPrice"));
			int totalBook = Util.checkInt(request.getParameter("totalBook"));
			int totalBook_check = Util.checkInt(request.getParameter("totalBook_point"));
			
			//포인트 적립
			int totalBook_point = totalBook_check * 100;
			
			
			//order.do 값 출력
//			Iterator<Map.Entry<Object, String>> entries = orderData.entrySet().iterator();
//			while (entries.hasNext()) {
//			    Map.Entry<Object, String> entry = entries.next();
//			    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
//			}
			
			//결제값 담기
			Map<Object, String> payData = new HashMap<Object, String>();
			//결제선택 체크
			//System.out.println("결제선택 " + request.getParameter("what"));
				payData.put("payChoice", request.getParameter("what"));
			if (request.getParameter("what").equals("card")) {
				payData.put("card_info", "카드번호:" + request.getParameter("cardNo") +
						"카드유효기간:" + request.getParameter("cardYear") + request.getParameter("cardMonth") +
						"카드사용자:" + request.getParameter("cardUser") + 
						"카드cvv:" + request.getParameter("cardCvv")
						);
			} if (request.getParameter("what").equals("bank")) {
				payData.put("bank_info", "예금주:" + request.getParameter("bankUser") + 
						"은행명:" + request.getParameter("bankName") + 
						"계좌번호:" + request.getParameter("bankNo")
						);
			} if (request.getParameter("what").equals("phone")) {
				payData.put("phone_info", "성명:" + request.getParameter("phoneUser") + 
						"핸드폰번호:" + request.getParameter("payPhoneA") + request.getParameter("payPhoneB") + request.getParameter("payPhoneC")
						);
			}
			
			//payData값 확인
//			Iterator<Map.Entry<Object, String>> entries2 = payData.entrySet().iterator();
//			while (entries2.hasNext()) {
//			    Map.Entry<Object, String> entry = entries2.next();
//			    System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
//			}
			
			//주문번호
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = sdf.format(new Date());
			
			//오더내역 DB에 삽입
			OrderDTO dto = new OrderDTO();
			Long order_no = Long.parseLong(today + "1");
			
			dto.setOrder_no(order_no);
			dto.setUser_no(1);
			dto.setName(orderData.get("name"));
			dto.setLoca(orderData.get("locaA" + "locaB" + "locaC"));
			dto.setLoca(orderData.get("store"));
			dto.setPhone(phone);
			dto.setNote(orderData.get("note"));
			dto.setPay_info(payData.get("card_info"));
			dto.setPay_info(payData.get("bank_info"));
			dto.setPay_info(payData.get("phone_info"));
			dto.setPoint(totalBook_point);
			dto.setTotalBook(totalBook);
			dto.setTotalPrice(totalPrice);
			
			orderService.orderFinishAction(dto);
			
			
			//화면에 결과값 뿌리기
			mv.addObject("totalBook",totalBook);
			mv.addObject("totalPrice", totalPrice);
			mv.addObject("totalBook_point",totalBook_point);
			mv.addObject("orderData", orderData);
			mv.addObject("payData", payData);
			
			return mv;
		}
}
	
	