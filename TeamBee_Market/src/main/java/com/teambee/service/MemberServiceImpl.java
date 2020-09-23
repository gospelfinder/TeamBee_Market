package com.teambee.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.teambee.dao.MemberDAO;
import com.teambee.dto.MemberVO;
import com.teambee.utils.SearchCriteria;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;
	
	@Override
	public List<MemberVO> memberList() throws Exception {
		// TODO Auto-generated method stub
		return dao.memberList();
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

	@Override
	public void logOut(HttpSession session) throws Exception {
		session.invalidate();
		
	}

	@Override
	public MemberVO memberDetail(String MEMBER_ID) throws Exception {
		// TODO Auto-generated method stub
		return dao.memberDetail(MEMBER_ID);
	}

	@Override
	public void insertMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertMember(vo);
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateMember(vo);
	}

	@Override
	public void deleteMember(String MEMBER_ID) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteMember(MEMBER_ID);
	}

	@Override
	public MemberVO find_id_pw(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.find_id_pw(vo);
	}
	
	@Override
	public int countMember(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countMember(scri);
	}
	@Override
	public List<MemberVO> memberListByPage(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.memberListByPage(scri);
	}

}
