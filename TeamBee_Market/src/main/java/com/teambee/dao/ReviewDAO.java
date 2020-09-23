package com.teambee.dao;

import java.util.List;

import com.teambee.dto.ReviewVO;

public interface ReviewDAO {

	// 리뷰 확인
	List<ReviewVO> reviewList(int PRODUCT_BNO) throws Exception;

	// 리뷰 쓰기
	public void insertReview(ReviewVO vo) throws Exception;

	// 리뷰 수정
	public void updateReview(ReviewVO vo) throws Exception;

	// 리뷰 삭제
	public void deleteReview(int REVIEW_BNO) throws Exception;

	// 리뷰 평점 수정
	public void updateRate(int PRODUCT_BNO) throws Exception;

	ReviewVO selectReview(int REVIEW_BNO) throws Exception;
}
