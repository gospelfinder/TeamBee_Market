package com.teambee.service;

import java.util.List;

import com.teambee.dto.FavoriteVO;

public interface FavoriteService {

	List<FavoriteVO> list(String MEMBER_ID)throws Exception;
	
	public void insert(FavoriteVO vo) throws Exception;
	
	public void delete(int PRODUCT_BNO) throws Exception;
}
