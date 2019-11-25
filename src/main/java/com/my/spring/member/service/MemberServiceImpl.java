package com.my.spring.member.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.member.dao.MemberDAO;
import com.my.spring.member.pass_lock.Login;
import com.my.spring.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	
	@Override
	public void signupMember(MemberVO vo) {
			memberDAO.signupMember(vo);
	}

	@Override
	public MemberVO loginMember(String member_id) {
		//최근로그인으로 업데이트
		memberDAO.updateRecentLogin(member_id);
		//방문수 올리기
		Map<String,Object> memberMap=new HashMap<String, Object>();
		int total_login=memberDAO.selectTotalLogin(member_id); //지금까지 방문수
		memberMap.put("total_login", total_login);
		memberMap.put("member_id", member_id);
		memberDAO.updateTotalLogin(memberMap); // 증가시키기
		return memberDAO.loginMember(member_id);
	}

	@Override
	public String idoverlap(String member_id) {
		return memberDAO.idoverlap(member_id);
	}

	@Override
	public MemberVO memberupdate(MemberVO vo) {
		return memberDAO.memberupdate(vo);
	}

	@Override
	public void secession(Map data) {
		memberDAO.secession(data);
	}



}
