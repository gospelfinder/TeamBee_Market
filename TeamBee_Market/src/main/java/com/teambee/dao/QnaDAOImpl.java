package com.teambee.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teambee.dto.QnaVO;
import com.teambee.utils.SearchCriteria;

@Repository
public class QnaDAOImpl implements QnaDAO{

	@Inject
	SqlSession session;
	
	@Override
	public List<QnaVO> qnaList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("qnaMapper.qnaList");
	}

	@Override
	public void insertQna(QnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert("qnaMapper.insertQna",vo);
		
	}

	@Override
	public void updateQna(QnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update("qnaMapper.updateQna",vo);
		
	}

	@Override
	public void deleteQna(int QNA_BNO) throws Exception {
		// TODO Auto-generated method stub
		session.delete("qnaMapper.deleteQna",QNA_BNO);
		
	}

	@Override
	public QnaVO detailQna(int QNA_BNO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("qnaMapper.detailQna",QNA_BNO);
	}

	@Override
	public String selectQnaReply(int QNA_BNO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("qnaMapper.selectQnaReply",QNA_BNO);
	}

	@Override
	public void updateQnaReply(QnaVO vo) throws Exception {
		// TODO Auto-generated method stub;
		session.update("qnaMapper.updateQnaReply",vo);
		
	}

	@Override
	public void deleteQnaReply(int QNA_BNO) throws Exception {
		// TODO Auto-generated method stub
		session.update("qnaMapper.deleteQnaReply",QNA_BNO);
	}
	
	@Override
	public int countQna(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("qnaMapper.countQna",scri);
	}
	@Override
	public List<QnaVO> qnaListByPage(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("qnaMapper.qnaListByPage",scri);
	}

}
