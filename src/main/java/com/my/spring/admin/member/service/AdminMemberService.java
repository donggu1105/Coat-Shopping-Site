package com.my.spring.admin.member.service;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.my.spring.member.vo.MemberVO;


public interface AdminMemberService {

	Map<String,Object> listMembers(Map<String,Object> pagingMap);


	void deleteMember(String member_code);


	Map<String,Object> viewMember(Map searchMap);


	Map<String, Object> getMemberStatics();





}
