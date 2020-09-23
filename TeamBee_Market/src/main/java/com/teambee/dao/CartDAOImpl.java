package com.teambee.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teambee.dto.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	SqlSession sqlSession;
	
	//1.장바구니 추가
	@Override
	public void insert(CartVO vo)throws Exception {
		sqlSession.insert("cartMapper.insertCart", vo);
	}
	
	//2. 장바구니 목록
	@Override
	public List<CartVO> listCart(String MEMBER_ID)throws Exception{
		return sqlSession.selectList("cartMapper.listCart", MEMBER_ID);
	}
	
	//3. 장바구니 삭제
	@Override
	public void delete(int CART_BNO)throws Exception {
		sqlSession.delete("cartMapper.deleteCart", CART_BNO);
	}
	
	//4. 장바구니 수정
	@Override
	public void modifyCart(CartVO vo)throws Exception {
		sqlSession.update("cartMapper.modifyCart", vo);
	}
	
	//5. 장바구니 금액 합계
	@Override
	public int sumMoney(String MEMBER_ID)throws Exception {
		sqlSession.selectOne("cartMapper.sumMoney", MEMBER_ID);
		return sqlSession.selectOne("cartMapper.sumMoney", MEMBER_ID);
	}
	
	//6. 장바구니 동일한 상품 레코드 확인
	@Override
	public int countCart(CartVO vo)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("PRODUCT_BNO", vo.getPRODUCT_BNO());
		map.put("MEMBER_ID", vo.getMEMBER_ID());
		return sqlSession.selectOne("cartMapper.countCart", map);
	}
	
	//7. 장바구니 상품수량 변경
	@Override
	public void updateCart(CartVO vo)throws Exception {
		sqlSession.update("cartMapper.updateCart", vo);
	}

	@Override
	public void increaseCart(CartVO vo)throws Exception {
		sqlSession.update("cartMapper.increaseCart", vo);
	}

	@Override
	public void decreaseCart(CartVO vo)throws Exception {
		sqlSession.update("cartMapper.decreaseCart", vo);
	}

	@Override
	public CartVO countAmount(CartVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cartMapper.countAmount",vo);
	}

}
