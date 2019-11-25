package com.my.spring.member.nonmember.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.spring.member.nonmember.vo.NonMemberVO;

@Repository("nonmemberDAO")
public class NonMemberDAOImpl implements NonMemberDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void nonmembersignup(NonMemberVO vo) throws Exception {
		sqlSession.insert("mapper.nonmember.nonmembersignup",vo);
	}

	@Override
	public String idoverlap(String nonmember_id) throws Exception {
		return sqlSession.selectOne("mapper.nonmember.idoverlap",nonmember_id);
	}

	@Override
	public NonMemberVO loginnonmember(String nonmember_id) {
		return sqlSession.selectOne("mapper.nonmember.loginnonmember",nonmember_id);
	}


}
