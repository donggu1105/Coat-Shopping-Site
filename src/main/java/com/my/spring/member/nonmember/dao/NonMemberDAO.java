package com.my.spring.member.nonmember.dao;

import com.my.spring.member.nonmember.vo.NonMemberVO;

public interface NonMemberDAO {
	void nonmembersignup(NonMemberVO vo) throws Exception;
	String idoverlap(String nonmember_id) throws Exception;
	NonMemberVO loginnonmember(String nonmember_id);
}
