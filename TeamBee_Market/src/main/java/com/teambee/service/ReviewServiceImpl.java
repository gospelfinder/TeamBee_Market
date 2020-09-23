package com.teambee.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teambee.dao.ReviewDAO;
import com.teambee.dto.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Inject
	ReviewDAO dao;

	@Override
	public List<ReviewVO> reviewList(int PRODUCT_BNO) throws Exception {
		return dao.reviewList(PRODUCT_BNO);
	}
	

	@Override
	public void insertReview(ReviewVO vo) throws Exception {
		dao.insertReview(vo);
		
	}

	@Override
	public void updateReview(ReviewVO vo) throws Exception {
		dao.updateReview(vo);
	}

	@Override
	public void deleteReview(int REVIEW_BNO) throws Exception {
		dao.deleteReview(REVIEW_BNO);
		
	}

	@Override
	public void updateRate(int PRODUCT_BNO) throws Exception {
		dao.updateRate(PRODUCT_BNO);
		
	}

	@Override
	public ReviewVO selectReview(int REVIEW_BNO) throws Exception {
		return dao.selectReview(REVIEW_BNO);
	}


}
