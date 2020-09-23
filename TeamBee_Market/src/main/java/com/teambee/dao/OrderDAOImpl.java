package com.teambee.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teambee.dto.OrderVO;
import com.teambee.utils.SearchCriteria;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	SqlSession session;
	
	@Override
	public List<OrderVO> orderList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("orderMapper.orderList");
	}

	@Override
	public List<OrderVO> orderListForMember(String MEMBER_ID) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("orderMapper.orderListForMember",MEMBER_ID);
	}
	
	@Override
	public int countOrder(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("orderMapper.countOrder",scri);
	}
	
	@Override
	public void updateOrder(int ORDER_BNO) throws Exception {
		session.update("orderMapper.updateOrderStatus",ORDER_BNO);
		
	}

	@Override
	public void insertOrder(OrderVO vo) throws Exception {
		session.insert("orderMapper.insertOrder",vo);
		
	}

	@Override
	public void deleteOrder(String MEMBER_ID) throws Exception {
		session.delete("orderMapper.deleteOrder",MEMBER_ID);
		
	}

	@Override
	public List<OrderVO> orderListForAdmin(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("orderMapper.orderListForAdmin", scri);
	}

	

	

}
