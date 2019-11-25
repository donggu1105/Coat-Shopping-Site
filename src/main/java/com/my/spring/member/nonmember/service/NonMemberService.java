package com.my.spring.member.nonmember.service;

import com.my.spring.member.nonmember.vo.NonMemberVO;

public interface NonMemberService {
	void nonmembersignup(NonMemberVO vo) throws Exception;
	String idoverlap(String nonmember_id) throws Exception;
	NonMemberVO loginnonmember(String nonmember_id);
}
