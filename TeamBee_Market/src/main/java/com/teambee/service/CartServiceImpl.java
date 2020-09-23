package com.teambee.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teambee.dao.CartDAO;
import com.teambee.dto.CartVO;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	CartDAO cartDao;
	
	//1. 장바구니 추가
	@Override
	public void insert(CartVO vo)throws Exception {
		cartDao.insert(vo);
	}
	
	//2. 장바구니 목록
	@Override
	public List<CartVO> listCart(String MEMBER_ID)throws Exception{
		return cartDao.listCart(MEMBER_ID);
	}
	
	//3. 장바구니 삭제
	@Override
	public void delete(int CARD_BNO)throws Exception {
		cartDao.delete(CARD_BNO);
	}
	
	//4. 장바구니 수정
	@Override
	public void modifyCart(CartVO vo)throws Exception {
		cartDao.modifyCart(vo);
	}
	
	//5. 장바구니 금액 합계
	@Override
	public int sumMoney(String MEMBER_ID)throws Exception {
		return cartDao.sumMoney(MEMBER_ID);
	}
	
	//6. 장바구니 상품 확인
	@Override
	public int countCart(CartVO vo)throws Exception {
		return cartDao.countCart(vo);
	}
	
	//7. 장바구니 상품 수량 변경
	@Override
	public void updateCart(CartVO vo) throws Exception{
		cartDao.updateCart(vo);
	}

	@Override
	public void increaseCart(CartVO vo) throws Exception{
		cartDao.increaseCart(vo);
	}

	@Override
	public void decreaseCart(CartVO vo) throws Exception{
		cartDao.decreaseCart(vo);
	}

	@Override
	public CartVO countAmount(CartVO vo) throws Exception {
		// TODO Auto-generated method stub
		return cartDao.countAmount(vo);
	}

	
}
