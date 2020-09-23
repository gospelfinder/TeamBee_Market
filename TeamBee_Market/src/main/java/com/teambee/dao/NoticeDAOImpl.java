package com.teambee.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teambee.dto.NoticeVO;
import com.teambee.utils.SearchCriteria;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	SqlSession session;
	
	@Override
	public List<NoticeVO> noticeList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("noticeMapper.noticeList");
	}

	@Override
	public NoticeVO noticeDetail(int NOTICE_BNO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("noticeMapper.noticeDetail",NOTICE_BNO);
	}

	@Override
	public void insertNotice(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert("noticeMapper.insertNotice",vo);
	}

	@Override
	public void updateNotice(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update("noticeMapper.updateNotice",vo);
	}

	@Override
	public void deleteNotice(int NOTICE_BNO) throws Exception {
		// TODO Auto-generated method stub
		session.delete("noticeMapper.deleteNotice",NOTICE_BNO);
	}
	
	@Override
	public int countNotice(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("noticeMapper.countNotice",scri);
	}
	@Override
	public List<NoticeVO> noticeListByPage(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("noticeMapper.noticeListByPage",scri);
	}

}
