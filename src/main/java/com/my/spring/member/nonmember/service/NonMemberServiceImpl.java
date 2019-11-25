package com.my.spring.member.nonmember.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.member.dao.MemberDAO;
import com.my.spring.member.nonmember.dao.NonMemberDAO;
import com.my.spring.member.nonmember.vo.NonMemberVO;
@Service("nonmemberService")
public class NonMemberServiceImpl implements NonMemberService{

	@Autowired
	NonMemberDAO nonmemberDAO;
	
	@Override
	public void nonmembersignup(NonMemberVO vo) throws Exception {
		nonmemberDAO.nonmembersignup(vo);
	}

	@Override
	public String idoverlap(String nonmember_id) throws Exception {
		return nonmemberDAO.idoverlap(nonmember_id);
	}

	@Override
	public NonMemberVO loginnonmember(String nonmember_id) {
		return nonmemberDAO.loginnonmember(nonmember_id);
	}


}
