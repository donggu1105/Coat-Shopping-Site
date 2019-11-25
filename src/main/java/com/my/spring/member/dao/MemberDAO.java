package com.my.spring.member.dao;

import java.util.Map;

import com.my.spring.member.vo.MemberDetailVO;
import com.my.spring.member.vo.MemberVO;

public interface MemberDAO {
	int signupMember(MemberVO vo);
	MemberVO loginMember(String member_id);
	String idoverlap(String member_id);
	MemberVO memberupdate(MemberVO vo);
	void secession(Map data);
	MemberDetailVO selectMemberDetail(int member_code);
	int selectAllCoupons(int member_code);
	void updateRecentLogin(String member_id);
	int selectTotalLogin(String member_id);
	void updateTotalLogin(Map<String, Object> memberMap);
	void updateMemberOrder(Map<String, Object> orderMap);
}
