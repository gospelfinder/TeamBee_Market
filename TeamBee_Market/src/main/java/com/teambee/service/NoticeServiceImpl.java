package com.teambee.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teambee.dao.NoticeDAO;
import com.teambee.dto.NoticeVO;
import com.teambee.utils.SearchCriteria;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	NoticeDAO dao;
	
	@Override
	public List<NoticeVO> noticeList() throws Exception {
		// TODO Auto-generated method stub
		return dao.noticeList();
	}

	@Override
	public NoticeVO noticeDetail(int NOTICE_BNO) throws Exception {
		// TODO Auto-generated method stub
		return dao.noticeDetail(NOTICE_BNO);
	}

	@Override
	public void insertNotice(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertNotice(vo);
	}

	@Override
	public void updateNotice(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateNotice(vo);
	}

	@Override
	public void deleteNotice(int NOTICE_BNO) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteNotice(NOTICE_BNO);
	}
	
	@Override
	public int countNotice(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countNotice(scri);
	}
	@Override
	public List<NoticeVO> noticeListByPage(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.noticeListByPage(scri);
	}

}
