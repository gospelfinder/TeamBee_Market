package com.teambee.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teambee.dto.QnaVO;
import com.teambee.service.QnaService;
import com.teambee.utils.PageMaker;
import com.teambee.utils.SearchCriteria;

@Controller
public class QnaController {

	@Inject
	QnaService service;
	
	@RequestMapping(value="/qna", method = RequestMethod.GET)
	public String qnaList(Model model, SearchCriteria scri)throws Exception{
		List<QnaVO> qnaList = service.qnaList();
		model.addAttribute("qnaList",qnaList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.countQna(scri));
		
		model.addAttribute("pageMaker",pageMaker);
		
		return "qna/qnaList";
	}
	
	@RequestMapping(value="/qnaContent", method = RequestMethod.GET)
	public String test()throws Exception{
		return "qna/qnaContent";
	}
	
	@RequestMapping(value="/qna_detail", method = RequestMethod.GET)
	public String qnaDetail(Model model, int QNA_BNO)throws Exception{
		QnaVO vo = service.detailQna(QNA_BNO);
		model.addAttribute("vo",vo);
		return "qna/qna_detail";
	}
	
	@RequestMapping(value = "/qna_write", method = RequestMethod.GET)
	public String qna_write()throws Exception {
		return "qna/qna_write";
	}
	
	@RequestMapping(value = "/qna_write", method = RequestMethod.POST)
	public String qna_write(QnaVO vo)throws Exception {
		service.insertQna(vo);
		return "redirect:/qna";
	}
	
	@RequestMapping(value = "/qna_update", method = RequestMethod.GET)
	public String qna_update(Model model, int QNA_BNO)throws Exception {
		QnaVO vo = service.detailQna(QNA_BNO);
		model.addAttribute("vo",vo);
		return "qna/qna_update";
	}
	
	@RequestMapping(value = "/updateQna", method = RequestMethod.POST)
	public String updateQna(QnaVO vo)throws Exception {
		service.updateQna(vo);
		return "redirect:/qna";
	}
	
	@RequestMapping(value = "/qna_delete")
	public String qna_delete(int QNA_BNO)throws Exception {
		service.deleteQna(QNA_BNO);
		return "redirect:/qna";
	}
	
	@RequestMapping(value = "/qnaReply_insert")
	public String qnaReply_insert(QnaVO vo, HttpServletRequest req)throws Exception {
		service.updateQnaReply(vo);
		String bno = req.getParameter("QNA_BNO");
		return "redirect:/qna_detail?QNA_BNO="+bno;
	}
	
	@RequestMapping(value = "/qnaReply_delete")
	public String qnaReply_delete(int QNA_BNO, HttpServletRequest req)throws Exception {
		service.deleteQnaReply(QNA_BNO);
		String bno = req.getParameter("QNA_BNO");
		return "redirect:/qna_detail?QNA_BNO="+bno;
	}
	
	
	
}
