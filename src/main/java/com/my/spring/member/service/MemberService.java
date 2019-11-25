package com.my.spring.member.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.my.spring.member.vo.MemberVO;


public interface MemberService {
	void signupMember(MemberVO vo);
	MemberVO loginMember(String member_id);
	String idoverlap(String member_id);
	MemberVO memberupdate(MemberVO vo);
	void secession(Map data);
}
