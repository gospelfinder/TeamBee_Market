package com.teambee.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teambee.dto.FavoriteVO;
@Repository
public class FavoriteDAOImpl implements FavoriteDAO{

	@Inject
	SqlSession session;
	
	@Override
	public List<FavoriteVO> list(String MEMBER_ID) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("favoriteMapper.favoriteList",MEMBER_ID);
	}

	@Override
	public void insert(FavoriteVO vo) throws Exception {
		session.insert("favoriteMapper.insertFavorite",vo);
		
	}

	@Override
	public void delete(int PRODUCT_BNO) throws Exception {
		session.delete("favoriteMapper.deleteFavorite",PRODUCT_BNO);
		
	}

}
