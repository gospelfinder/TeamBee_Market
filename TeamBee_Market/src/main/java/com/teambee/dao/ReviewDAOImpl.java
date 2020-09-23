package com.teambee.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teambee.dto.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	SqlSession session;
	
	@Override
	public List<ReviewVO> reviewList(int PRODUCT_BNO) throws Exception {
		return session.selectList("reviewMapper.reviewList",PRODUCT_BNO);
	}

	@Override
	public void insertReview(ReviewVO vo) throws Exception {
		session.insert("reviewMapper.insertReview",vo);
		
	}

	@Override
	public void updateReview(ReviewVO vo) throws Exception {
		session.update("reviewMapper.updateReview",vo);
		
	}

	@Override
	public void deleteReview(int REVIEW_BNO) throws Exception {
		session.delete("reviewMapper.deleteReview",REVIEW_BNO);
		
	}

	@Override
	public void updateRate(int PRODUCT_BNO) throws Exception {
		session.update("reviewMapper.updateRate",PRODUCT_BNO);
		
	}

	@Override
	public ReviewVO selectReview(int REVIEW_BNO) throws Exception {
		return session.selectOne("reviewMapper.selectReview",REVIEW_BNO);
	}


}