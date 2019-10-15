package com.booknabada.controller;

import java.util.List;

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
		
		int book = 1;
		
		book = Util.checkInt(request.getParameter("page"));
		
		//해당 bno -> DB로 보내서 해당 글 가져오기(DTO)
		List<OrderDTO> orderDetail = orderService.detail(book);
				
		//DB에서 온 데이터 jsp에 뿌리기
		mv.addObject("orderDetail", orderDetail);	
		return mv;
	}
	
	//결제페이지
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
	
	