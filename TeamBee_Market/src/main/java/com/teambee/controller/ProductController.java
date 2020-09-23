package com.teambee.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;

import com.teambee.dto.ProductVO;
import com.teambee.dto.ReviewVO;
import com.teambee.service.ProductService;
import com.teambee.service.ReviewService;
import com.teambee.utils.Criteria;
import com.teambee.utils.PageMaker;

@Controller
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	ProductService service;
	@Inject
	ReviewService Rservice;

	
	// 상품 상세
	@RequestMapping(value = "/detail")
	public String detail(Model model, int PRODUCT_BNO) throws Exception {

		ProductVO detail = service.detail(PRODUCT_BNO);
		model.addAttribute("detail", detail);

		List<ReviewVO> reviewList = Rservice.reviewList(PRODUCT_BNO);
		model.addAttribute("reviewList", reviewList);

		service.increaseHit(PRODUCT_BNO);

		return "product/detail";
	}

	// 상품 종류별 구분
	@RequestMapping(value = "/category")
	public String showProductByDate(Model model, String PRODUCT_TYPE) throws Exception {

		List<ProductVO> list = service.showProductByType(PRODUCT_TYPE);
		model.addAttribute("list",list);

		return "product/category";
	}

	// 상품 등록
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() throws Exception {
		return "product/insert";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertProduct(ProductVO vo) throws Exception {

		service.insertProduct(vo);
		return "redirect:/index";
	}

	// 리뷰 쓰기
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	public String insertReview(ReviewVO vo, HttpServletRequest req, int PRODUCT_BNO) throws Exception {
		Rservice.insertReview(vo);
		Rservice.updateRate(PRODUCT_BNO);
		String bno = req.getParameter("PRODUCT_BNO");
		return "redirect:/detail?PRODUCT_BNO=" + bno;
	}

	// 리뷰수정
	@RequestMapping(value = "/updateReview", method = RequestMethod.GET)
	public String updateReview(Model model, int REVIEW_BNO, int PRODUCT_BNO) throws Exception {

		ProductVO detail = service.detail(PRODUCT_BNO);
		model.addAttribute("detail", detail);

		List<ReviewVO> reviewList = Rservice.reviewList(PRODUCT_BNO);
		model.addAttribute("reviewList", reviewList);

		ReviewVO review = Rservice.selectReview(REVIEW_BNO);
		model.addAttribute("review",review);
		
		
		//ReviewVO vo = Rservice.selectReview(REVIEW_BNO);
		//model.addAttribute("vo", vo);
		
		return "product/updateReview";

	}

	@RequestMapping(value = "/updateReview", method = RequestMethod.POST)
	public String updateReview(ReviewVO vo, int PRODUCT_BNO, HttpServletRequest req) throws Exception {
		Rservice.updateReview(vo);
		Rservice.updateRate(PRODUCT_BNO);

		String bno = req.getParameter("PRODUCT_BNO");
		return "redirect:/detail?PRODUCT_BNO=" + bno;
	}

	// 리뷰삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteReview(int REVIEW_BNO, int PRODUCT_BNO, HttpServletRequest req) throws Exception {
		Rservice.deleteReview(REVIEW_BNO);
		Rservice.updateRate(PRODUCT_BNO);

		String bno = req.getParameter("PRODUCT_BNO");
		return "redirect:/detail?PRODUCT_BNO=" + bno;
	}

	@Resource(name = "uploadPath")
	String uploadPath;

	@RequestMapping(value = "/form")
	public void form() throws Exception {
	}

	@RequestMapping(value = "/result")
	public void result() throws Exception {
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView uplodaForm(MultipartFile file, ModelAndView mav) throws Exception {

		logger.info("파일이름 :" + file.getOriginalFilename());
		logger.info("파일크기 : " + file.getSize());
		logger.info("컨텐트 타입 : " + file.getContentType());

		String savedName = file.getOriginalFilename();

		File target = new File(uploadPath, savedName);

		// 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		// FileCopyUtils.copy(바이트배열, 파일객체)
		FileCopyUtils.copy(file.getBytes(), target);

		mav.setViewName("product/insert");
		mav.addObject("savedName", savedName);

		return mav; // uploadResult.jsp(결과화면)로 포워딩
	}

}
