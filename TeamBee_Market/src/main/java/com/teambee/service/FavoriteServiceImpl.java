package com.teambee.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teambee.dao.FavoriteDAO;
import com.teambee.dto.FavoriteVO;

@Service
public class FavoriteServiceImpl implements FavoriteService{

	@Inject
	FavoriteDAO dao;
	
	@Override
	public List<FavoriteVO> list(String MEMBER_ID) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(MEMBER_ID);
	}

	@Override
	public void insert(FavoriteVO vo) throws Exception {
		dao.insert(vo);
		
	}

	@Override
	public void delete(int PRODUCT_BNO) throws Exception {
		dao.delete(PRODUCT_BNO);
		
	}

}
