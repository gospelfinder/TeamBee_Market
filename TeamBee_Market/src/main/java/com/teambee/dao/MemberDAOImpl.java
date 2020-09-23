package com.teambee.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.teambee.dto.MemberVO;
import com.teambee.utils.SearchCriteria;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession session;
	
	@Override
	public List<MemberVO> memberList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("memberMapper.memberList");
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("memberMapper.login",vo);
	}

	@Override
	public void logOut(HttpSession session) throws Exception {
		
	}

	@Override
	public MemberVO memberDetail(String MEMBER_ID) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("memberMapper.memberDetail",MEMBER_ID);
	}

	@Override
	public void insertMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert("memberMapper.insertMember",vo);
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update("memberMapper.updateMember",vo);
	}

	@Override
	public void deleteMember(String MEMBER_ID) throws Exception {
		// TODO Auto-generated method stub
		session.delete("memberMapper.deleteMember",MEMBER_ID);
	}

	@Override
	public MemberVO find_id_pw(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("memberMapper.find_id_pw",vo);
	}
	
	@Override
	public int countMember(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("memberMapper.countMember",scri);
	}
	@Override
	public List<MemberVO> memberListByPage(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("memberMapper.memberListByPage",scri);
	}

}
