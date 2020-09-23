package com.teambee.dao;

import java.util.List;

import com.teambee.dto.NoticeVO;
import com.teambee.utils.SearchCriteria;

public interface NoticeDAO {

	List<NoticeVO> noticeList()throws Exception;
	
	NoticeVO noticeDetail(int NOTICE_BNO)throws Exception;
	
	public void insertNotice(NoticeVO vo)throws Exception;
	
	public void updateNotice(NoticeVO vo)throws Exception;
	
	public void deleteNotice(int NOTICE_BNO)throws Exception;
	
	public int countNotice(SearchCriteria scri) throws Exception;
	
	List<NoticeVO> noticeListByPage(SearchCriteria scri)throws Exception;
}
