package com.teambee.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.teambee.dao.QnaDAO;
import com.teambee.dto.QnaVO;
import com.teambee.utils.SearchCriteria;

@Service
public class QnaServiceImpl implements QnaService{

	@Inject
	QnaDAO dao;
	
	@Override
	public List<QnaVO> qnaList() throws Exception {
		// TODO Auto-generated method stub
		return dao.qnaList();
	}

	@Override
	public void insertQna(QnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertQna(vo);
	}

	@Override
	public void updateQna(QnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateQna(vo);
	}

	@Override
	public void deleteQna(int QNA_BNO) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteQna(QNA_BNO);
	}

	@Override
	public QnaVO detailQna(int QNA_BNO) throws Exception {
		// TODO Auto-generated method stub
		return dao.detailQna(QNA_BNO);
	}

	@Override
	public String selectQnaReply(int QNA_BNO) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectQnaReply(QNA_BNO);
	}

	@Override
	public void updateQnaReply(QnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateQnaReply(vo);
	}

	@Override
	public void deleteQnaReply(int QNA_BNO) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteQnaReply(QNA_BNO);
	}
	
	@Override
	public int countQna(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countQna(scri);
	}
	@Override
	public List<QnaVO> qnaListByPage(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.qnaListByPage(scri);
	}

}
