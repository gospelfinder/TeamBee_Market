package com.teambee.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teambee.dto.NoticeVO;
import com.teambee.service.NoticeService;
import com.teambee.utils.PageMaker;
import com.teambee.utils.SearchCriteria;

@Controller
public class NoticeController {

	@Inject
	NoticeService service;
	
	@RequestMapping(value="/noticeList")
	public String list(Model model, SearchCriteria scri)throws Exception{
		List<NoticeVO> list = service.noticeList();
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.countNotice(scri));
		
		model.addAttribute("pageMaker",pageMaker);
		
		return "notice/notice";
	}
	
	@RequestMapping(value="/noticeDetail")
	public String detail(Model model,int NOTICE_BNO)throws Exception{
		NoticeVO vo = service.noticeDetail(NOTICE_BNO);
		model.addAttribute("vo", vo);
		
		return "notice/noticeDetail";
	}
	
	@RequestMapping(value="/insertNotice", method = RequestMethod.GET)
	public String insertGET()throws Exception{
		return "notice/notice_write";
	}
	
	@RequestMapping(value="/insertNotice", method = RequestMethod.POST)
	public String insert(NoticeVO vo)throws Exception{
		service.insertNotice(vo);
		return "redirect:/noticeList";
	}
	
	@RequestMapping(value="/updateNotice", method = RequestMethod.GET)
	public String update(int NOTICE_BNO,Model model)throws Exception{
		NoticeVO vo = service.noticeDetail(NOTICE_BNO); 
		model.addAttribute("vo",vo);
		return "notice/notice_update";
	}
	
	@RequestMapping(value="/updateNotice", method = RequestMethod.POST)
	public String update(NoticeVO vo,HttpServletRequest req)throws Exception{
		service.updateNotice(vo);
		String bno = req.getParameter("NOTICE_BNO");
		return "redirect:/noticeDetail?NOTICE_BNO="+bno;
	}
	
	@RequestMapping(value="/deleteNotice")
	public String delete(int NOTICE_BNO)throws Exception{
		service.deleteNotice(NOTICE_BNO);
		return "redirect:/noticeList";
	}
	
	
}
