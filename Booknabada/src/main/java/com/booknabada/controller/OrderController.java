package com.booknabada.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.booknabada.service.OrderService;

@Controller
public class OrderController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	//주문화면
	@RequestMapping(value="order/order.do")
	public ModelAndView order() throws Exception{
		ModelAndView mv = new ModelAndView("order/order");
	
		return mv;
	}
	
	//결제페페이지
	@RequestMapping(value="order/orderPay.do")
	public ModelAndView orderPay() throws Exception{
		ModelAndView mv = new ModelAndView("order/orderPay");
	
		return mv;
	}
	
	//주문완료
		@RequestMapping(value="order/orderFinish.do")
		public ModelAndView orderFinish() throws Exception{
			ModelAndView mv = new ModelAndView("order/orderFinish");
		
			return mv;
		}
}
	
	