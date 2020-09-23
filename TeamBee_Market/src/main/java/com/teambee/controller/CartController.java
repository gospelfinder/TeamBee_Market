package com.teambee.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teambee.dto.CartVO;
import com.teambee.dto.OrderVO;
import com.teambee.dto.ProductVO;
import com.teambee.service.CartService;
import com.teambee.service.FavoriteService;
import com.teambee.service.OrderService;
import com.teambee.service.ProductService;

@Controller
public class CartController {

	@Inject
	CartService cartService;
	@Inject
	FavoriteService Fservice;
	@Inject
	OrderService Oservice;
	@Inject
	ProductService Pservice;

	// 1.장바구니 추가
	@RequestMapping("insertCart")
	public String insert(CartVO vo, String MEMBER_ID, int PRODUCT_BNO) throws Exception {

		if (vo.getAMOUNT() == 0) {
			vo.setAMOUNT(1);
		}

		int count = cartService.countCart(vo);

		if (count == 0) {
			// 없으면 insert
			cartService.insert(vo);
		} else if (count >= 1) {

			cartService.updateCart(vo);
		}

		Fservice.delete(PRODUCT_BNO);

		return "redirect:/cart?MEMBER_ID=" + MEMBER_ID;
	}

	// 2. 장바구니 목록
	@RequestMapping("cart")
	public ModelAndView list(String MEMBER_ID, ModelAndView mav)throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		List<CartVO> list = cartService.listCart(MEMBER_ID); // 장바구니 정보
		int sumMoney = cartService.sumMoney(MEMBER_ID); // 장바구니 전체 금액 호출
		// 장바구니 전체 금액에 따라 배송비 구분
		// 배송료(10만원이상은 무료, 미만은 2500원)
		int fee = sumMoney >= 100000 ? 0 : 2500;
		map.put("list", list); // 장바구니 정보를 map에 저장
		map.put("count", list.size()); // 장바구니 상품의 유무
		map.put("sumMoney", sumMoney); // 장바구니 전체 금액
		map.put("fee", fee); // 배송금액
		map.put("allSum", sumMoney + fee); // 주문 상품 전체 금액
		mav.setViewName("/cart/cart");
		mav.addObject("map", map);
		return mav;
		
	}

	// 3. 장바구니 삭제
	@RequestMapping("deleteCart")
	public String delete(int CART_BNO, String MEMBER_ID)throws Exception {
		cartService.delete(CART_BNO);
		return "redirect:/cart?MEMBER_ID=" + MEMBER_ID;
	}

	// 4. 장바구니 수정
	@RequestMapping("update.do")
	public String update(@RequestParam int[] amount, @RequestParam int[] PRODUCT_BNO, HttpSession session)throws Exception {
		// session의 id
		String member_Id = (String) session.getAttribute("member_Id");
		// 레코드의 갯수 만큼 반복문 실행
		for (int i = 0; i < PRODUCT_BNO.length; i++) {
			CartVO vo = new CartVO();
			vo.setMEMBER_ID(member_Id);
			vo.setAMOUNT(amount[i]);
			vo.setPRODUCT_BNO(PRODUCT_BNO[i]);
			cartService.modifyCart(vo);
		}
		return "redirect:/cart";
	}

	// 5. 수량 증가
	@RequestMapping("increaseCart")
	public String increase(CartVO vo) throws Exception{

		cartService.increaseCart(vo);
		return "redirect:/cart?MEMBER_ID=" + vo.getMEMBER_ID();
	}

	// 6. 수량 감소
	@RequestMapping("decreaseCart")
	public String decrease(CartVO vo) throws Exception{

		cartService.decreaseCart(vo);
		return "redirect:/cart?MEMBER_ID=" + vo.getMEMBER_ID();
	}

	@RequestMapping("purchaseCart")
	public String purchaseCart(HttpServletRequest req)throws Exception {
		
		String[] bno = req.getParameterValues("PRODUCT_BNO");
		
		int[] array = new int[bno.length];
		
		for(int i=0; i<array.length; i++) {
			array[i] = Integer.parseInt(bno[i]);
			
			ProductVO PVO = Pservice.detail(array[i]);
			
			CartVO CVO = new CartVO();
			CVO.setMEMBER_ID(req.getParameter("MEMBER_ID"));
			CVO.setPRODUCT_BNO(PVO.getPRODUCT_BNO());
			CartVO CVO2 = cartService.countAmount(CVO);
			
			OrderVO vo = new OrderVO();
			vo.setMEMBER_ID(req.getParameter("MEMBER_ID"));
			vo.setPRODUCT_BNO(PVO.getPRODUCT_BNO());
			vo.setPRODUCT_TITLE(PVO.getPRODUCT_TITLE());
			vo.setORDER_AMOUNT(CVO2.getAMOUNT());
			
			Oservice.insertOrder(vo);
			
			cartService.delete(CVO2.getCART_BNO());
			
		}
		 

		
		/*
		
		
		for(int i = 0; i<bno.length; i++){
		     array[i] = Integer.parseInt(bno[i]);
		     array2[i] = Integer.parseInt(amount[i]);
		     
		     OrderVO vo = new OrderVO(); 
		     vo.setPRODUCT_BNO(array[i]);
		     vo.setORDER_AMOUNT(array2[i]);
		     vo.setPRODUCT_TITLE(title[i]);
		     vo.setMEMBER_ID(req.getParameter("MEMBER_ID"));
		     
		     System.out.println("vo.getORDER_AMOUNT : "+vo.getORDER_AMOUNT());
		  
		     Oservice.insertOrder(vo);
		}
		 */

		return "redirect:/orderListForMember?MEMBER_ID="+req.getParameter("MEMBER_ID");
	}
}
