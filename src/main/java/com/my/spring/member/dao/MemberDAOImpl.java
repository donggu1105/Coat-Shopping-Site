package com.my.spring.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.spring.member.vo.MemberDetailVO;
import com.my.spring.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int signupMember(MemberVO vo) {
		return sqlSession.insert("mapper.member.signupMember" , vo);
	}

	@Override
	public MemberVO loginMember(String member_id) {
		MemberVO vo = sqlSession.selectOne("mapper.member.loginMember",member_id);
		return vo;
	}

	@Override
	public String idoverlap(String member_id) {
		return sqlSession.selectOne("mapper.member.idoverlap" , member_id);
	}

	@Override
	public MemberVO memberupdate(MemberVO vo) {
		 sqlSession.update("mapper.member.memberupdate" , vo);
		 return sqlSession.selectOne("mapper.member.loginMember" , vo);
	}

	@Override
	public void secession(Map data) {
		sqlSession.delete("mapper.member.secession" , data);
	}
	
	@Override
	public MemberDetailVO selectMemberDetail(int member_code) {
		return sqlSession.selectOne("mapper.member.selectMemberDetail", member_code);
	}
	
	@Override
	public int selectAllCoupons(int member_code) {
		return sqlSession.selectOne("mapper.member.selectAllCoupons", member_code);
	}


	@Override
	public void updateRecentLogin(String member_id) {
			sqlSession.update("mapper.member.updateRecentLogin",member_id);
	}

	@Override
	public int selectTotalLogin(String member_id) {
		return sqlSession.selectOne("mapper.member.selectTotalLogin", member_id);
	}

	@Override
	public void updateTotalLogin(Map memberMap) {
		sqlSession.update("mapper.member.updateTotalLogin",memberMap);
	}

	@Override
	public void updateMemberOrder(Map<String, Object> orderMap) {
		sqlSession.update("mapper.member.updateMemberOrder", orderMap);
	}



	
}
