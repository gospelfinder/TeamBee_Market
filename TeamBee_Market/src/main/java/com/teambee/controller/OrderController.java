package com.teambee.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teambee.dto.OrderVO;
import com.teambee.service.OrderService;
import com.teambee.service.ProductService;
import com.teambee.utils.PageMaker;
import com.teambee.utils.SearchCriteria;

@Controller
public class OrderController {

	@Inject
	OrderService service;
	@Inject
	ProductService pService;

	// 상품 보여주기
	@RequestMapping(value = "/orderList")
	public String orderListForAdmin(Model model, SearchCriteria scri) throws Exception {
		List<OrderVO> orderList = service.orderListForAdmin(scri);
		model.addAttribute("orderList", orderList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.countOrder(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "order/orderList";
	}
	
/*
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderList(Model model, SearchCriteria scri) throws Exception {
		List<OrderVO> orderList = service.orderList();
		model.addAttribute("orderList", orderList);
		return "order/orderList";
	}
*/

	
	@RequestMapping(value = "/orderListForMember", method = RequestMethod.GET)
	public String orderListForMember(Model model,String MEMBER_ID) throws Exception {
		List<OrderVO> listForMember = service.orderListForMember(MEMBER_ID);
		model.addAttribute("listForMember", listForMember);
		return "order/orderListForMember";
	}

	@RequestMapping(value = "/updateOrder")
	public String update(int ORDER_BNO) throws Exception {
		service.updateOrder(ORDER_BNO);
		return "redirect:/orderList";
	}

	@RequestMapping(value = "/insertOrder")
	public String insertOrder(OrderVO vo, HttpServletRequest req) throws Exception {
		service.insertOrder(vo);
		pService.decreaseAmount(vo);
		
		String id = req.getParameter("MEMBER_ID");
		return "redirect:/orderListForMember?MEMBER_ID="+id;
	}
	/*
	@RequestMapping(value = "/insertOrder", method = RequestMethod.POST)
	public String insertPOST(OrderVO vo) throws Exception {
		service.insertOrder(vo);
		return "redirect:/order/orderList";// ***위에 회원용 주문내역으로 수정해야함***
	}
	*/
	@RequestMapping(value = "/deleteOrder", method = RequestMethod.POST)
	public String delete(String MEMBER_ID) throws Exception {
		service.deleteOrder(MEMBER_ID);
		return "redirect:/order/orderList";// ***위에 회원용 주문내역으로 수정해야함***
	}
}
