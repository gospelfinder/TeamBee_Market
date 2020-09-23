package com.teambee.service;

import java.util.List;

import com.teambee.dto.OrderVO;
import com.teambee.utils.SearchCriteria;

public interface OrderService {

	List<OrderVO> orderList()throws Exception;
	
	List<OrderVO> orderListForAdmin(SearchCriteria scri)throws Exception;
	
	public int countOrder(SearchCriteria scri) throws Exception;

	List<OrderVO> orderListForMember(String MEMBER_ID)throws Exception;
	
	public void updateOrder(int ORDER_BNO)throws Exception;
	
	public void insertOrder(OrderVO vo)throws Exception;
	
	public void deleteOrder(String MEMBER_ID) throws Exception;
}
