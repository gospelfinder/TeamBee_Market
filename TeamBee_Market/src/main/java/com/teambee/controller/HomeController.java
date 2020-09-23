package com.teambee.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teambee.dto.ProductVO;
import com.teambee.dto.ReviewVO;
import com.teambee.service.ProductService;
import com.teambee.service.ReviewService;
import com.teambee.utils.Criteria;
import com.teambee.utils.PageMaker;
import com.teambee.utils.SearchCriteria;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Inject
	ProductService service;
	@Inject
	ReviewService Rservice;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 상품 보여주기
	@RequestMapping(value = "/")
	public String list(Model model, SearchCriteria scri) throws Exception {

		model.addAttribute("list", service.showProductByPage(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "index";
	}

	// 상품 보여주기
	@RequestMapping(value = "/index")
	public String index(Model model, SearchCriteria scri) throws Exception {

		model.addAttribute("list", service.showProductByPage(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "index";
	}
	


}
