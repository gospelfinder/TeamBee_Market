package com.teambee.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.teambee.dto.MemberVO;
import com.teambee.utils.SearchCriteria;

public interface MemberDAO {

	//회원리스트
	List<MemberVO> memberList()throws Exception;
	
	public MemberVO login(MemberVO vo)throws Exception;
	
	public void logOut(HttpSession session) throws Exception;
	
	MemberVO memberDetail(String MEMBER_ID)throws Exception;
	
	public void insertMember(MemberVO vo)throws Exception;
	
	public void updateMember(MemberVO vo)throws Exception;
	
	public void deleteMember(String MEMBER_ID)throws Exception;
	
	MemberVO find_id_pw(MemberVO vo)throws Exception;
	
	public int countMember(SearchCriteria scri) throws Exception;
	
	List<MemberVO> memberListByPage(SearchCriteria scri)throws Exception;
	
}
