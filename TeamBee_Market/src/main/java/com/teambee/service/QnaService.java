package com.teambee.service;

import java.util.List;

import com.teambee.dto.QnaVO;
import com.teambee.utils.SearchCriteria;

public interface QnaService {

	List<QnaVO> qnaList() throws Exception;

	public void insertQna(QnaVO vo) throws Exception;

	public void updateQna(QnaVO vo) throws Exception;

	public void deleteQna(int QNA_BNO) throws Exception;

	QnaVO detailQna(int QNA_BNO) throws Exception;

	String selectQnaReply(int QNA_BNO) throws Exception;

	public void updateQnaReply(QnaVO vo) throws Exception;

	public void deleteQnaReply(int QNA_BNO) throws Exception;
	
	public int countQna(SearchCriteria scri) throws Exception;
	
	List<QnaVO> qnaListByPage(SearchCriteria scri)throws Exception;
}
