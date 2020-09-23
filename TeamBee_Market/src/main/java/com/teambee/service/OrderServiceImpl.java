package com.teambee.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teambee.dao.OrderDAO;
import com.teambee.dto.OrderVO;
import com.teambee.utils.SearchCriteria;

@Service
public class OrderServiceImpl implements OrderService{

	@Inject
	OrderDAO dao;

	@Override
	public List<OrderVO> orderList() throws Exception {
		// TODO Auto-generated method stub
		return dao.orderList();
	}

	@Override
	public List<OrderVO> orderListForMember(String MEMBER_ID) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderListForMember(MEMBER_ID);
	}
	
	@Override
	public int countOrder(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countOrder(scri);
	}
	
	@Override
	public void updateOrder(int ORDER_BNO) throws Exception {
		dao.updateOrder(ORDER_BNO);
		
	}

	@Override
	public void insertOrder(OrderVO vo) throws Exception {
		dao.insertOrder(vo);
		
	}

	@Override
	public void deleteOrder(String MEMBER_ID) throws Exception {
		dao.deleteOrder(MEMBER_ID);
		
	}

	@Override
	public List<OrderVO> orderListForAdmin(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderListForAdmin(scri);
	}

	

	
	
}
