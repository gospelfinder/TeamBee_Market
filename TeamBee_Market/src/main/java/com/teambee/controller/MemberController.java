package com.teambee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teambee.dto.CartVO;
import com.teambee.dto.FavoriteVO;
import com.teambee.dto.MemberVO;
import com.teambee.service.FavoriteService;
import com.teambee.service.MemberService;
import com.teambee.utils.PageMaker;
import com.teambee.utils.SearchCriteria;

@Controller
public class MemberController {

	@Inject
	MemberService service;
	@Inject
	FavoriteService Fservice;

	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String memberList(Model model, SearchCriteria scri) throws Exception {
		List<MemberVO> memberList = service.memberList();
		model.addAttribute("memberList", memberList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.countMember(scri));
		
		model.addAttribute("pageMaker",pageMaker);
		
		return "member/memberList";
	}
	
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() throws Exception {
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, Model model, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);

		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/login";

		} else {
			session.setAttribute("member", login);
		}

		return "redirect:/index";
	}

	@RequestMapping(value = "/logOut")
	public String logOut(HttpSession session) throws Exception {
		service.logOut(session);
		return "redirect:/index";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinPage(Model model) throws Exception {
		List<MemberVO> memberList = service.memberList();
		model.addAttribute("memberList", memberList);
		return "member/join";
	}

	@RequestMapping(value = "/insertMember")
	public String join(MemberVO vo, HttpServletRequest req) throws Exception {

		String phone1 = req.getParameter("MEMBER_PHONE1");
		String phone2 = req.getParameter("MEMBER_PHONE2");
		String phone3 = req.getParameter("MEMBER_PHONE3");

		String address1 = req.getParameter("MEMBER_ADDRESS1");
		String address2 = req.getParameter("MEMBER_ADDRESS2");
		String address3 = req.getParameter("MEMBER_ADDRESS3");
		vo.setMEMBER_PHONE(phone1 + "-" + phone2 + "-" + phone3);
		vo.setMEMBER_ADDRESS("(" + address1 + ")" + address2 + " " + address3);

		service.insertMember(vo);

		return "redirect:/login";

	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updatePage(Model model, String MEMBER_ID) throws Exception {
		MemberVO vo = service.memberDetail(MEMBER_ID);
		model.addAttribute("vo", vo);
		return "member/update";
	}

	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String update(MemberVO vo, HttpServletRequest req) throws Exception {

		String phone1 = req.getParameter("MEMBER_PHONE1");
		String phone2 = req.getParameter("MEMBER_PHONE2");
		String phone3 = req.getParameter("MEMBER_PHONE3");

		String address1 = req.getParameter("MEMBER_ADDRESS1");
		String address2 = req.getParameter("MEMBER_ADDRESS2");
		String address3 = req.getParameter("MEMBER_ADDRESS3");

		vo.setMEMBER_PHONE(phone1 + "-" + phone2 + "-" + phone3);
		vo.setMEMBER_ADDRESS("(" + address1 + ")" + address2 + " " + address3);

		service.updateMember(vo);

		return "redirect:/";
	}

	@RequestMapping(value = "/deleteMember")
	public String deleteMember(String MEMBER_ID, HttpSession session) throws Exception {
		service.deleteMember(MEMBER_ID);
		service.logOut(session);
		return "redirect:/";
	}

	@RequestMapping(value = "/favoriteList", method = RequestMethod.GET)
	public String favoriteList(Model model, String MEMBER_ID) throws Exception {
		List<FavoriteVO> list = Fservice.list(MEMBER_ID);
		model.addAttribute("list", list);
		return "member/favoriteList";
	}

	@RequestMapping(value = "/insertFavorite")
	public String insertFavorite(Model model, FavoriteVO vo, HttpServletRequest req) throws Exception {
		Fservice.insert(vo);
		String id = req.getParameter("MEMBER_ID");
		return "redirect:/favoriteList?MEMBER_ID=" + id;
	}

	@RequestMapping(value = "/deleteFavorite")
	public String deleteFavorite(int PRODUCT_BNO, HttpServletRequest req) throws Exception {
		Fservice.delete(PRODUCT_BNO);
		String id = req.getParameter("MEMBER_ID");
		return "redirect:/favoriteList?MEMBER_ID=" + id;
	}

	@RequestMapping(value = "/find_id_pw", method = RequestMethod.GET)
	public String find() throws Exception {
		return "member/find_id_pw";
	}

	@RequestMapping(value = "/find_id_pw2", method = RequestMethod.GET)
	public String find_id_pw2(Model model) throws Exception {
		return "member/find_id_pw2";
	}

	@RequestMapping(value = "/find", method = RequestMethod.POST)
	public ModelAndView find_id_pw(MemberVO vo, Model model, RedirectAttributes rttr) throws Exception {
		
		MemberVO find = service.find_id_pw(vo);
		
		if (find == null) {
			rttr.addFlashAttribute("msg", false);
			ModelAndView view = new ModelAndView();
			
			view.setViewName("redirect:/find_id_pw");
			
			return view;
			
		}else {
			
			ModelAndView view = new ModelAndView();
			
			view.setViewName("member/find_id_pw2");
			view.addObject("find",find);
			
			return view;
		} 
	}
	
}
