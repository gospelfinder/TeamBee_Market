package com.teambee.dao;

import java.util.List;

import com.teambee.dto.CartVO;

public interface CartDAO {
	
	public void insert(CartVO vo) throws Exception;

	List<CartVO> listCart(String MEMBER_ID) throws Exception;

	public void delete(int CART_BNO) throws Exception;

	public void modifyCart(CartVO vo) throws Exception;

	public int sumMoney(String MEMBER_ID) throws Exception;

	public int countCart(CartVO vo) throws Exception;

	public void updateCart(CartVO vo) throws Exception;
	
	public void increaseCart(CartVO vo) throws Exception;
	
	public void decreaseCart(CartVO vo) throws Exception;
	
	CartVO countAmount(CartVO vo) throws Exception;
}
