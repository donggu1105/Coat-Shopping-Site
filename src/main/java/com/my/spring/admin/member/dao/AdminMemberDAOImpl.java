package com.my.spring.admin.member.dao;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.spring.member.vo.MemberVO;

@Repository("adminMemberDAO")
public class AdminMemberDAOImpl implements AdminMemberDAO {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MemberVO memberVO;


	@Override
	public List<MemberVO> selectAllMembersList(Map pagingMap) {
		return sqlSession.selectList("mapper.admin.member.selectAllMembersList", pagingMap);
	}
	@Override
	public void deleteMember(String member_code) {
		sqlSession.delete("mapper.admin.member.deleteMember", member_code);
	}
	@Override
	public int selectTotalMembers() {
		return sqlSession.selectOne("mapper.admin.member.selectTotalMembers");
		
		
	}
	@Override
	public MemberVO selectMemberByCertain(Map searchMap) {
		return sqlSession.selectOne("mapper.admin.member.selectMemberByCertain", searchMap);
	}
	@Override
	public int selectAllMemberMen() {
		String gender="남자";
		return sqlSession.selectOne("mapper.admin.member.selectAllMemberMen",gender);
	}
	@Override
	public int selectAllMemberWomen() {
		String gender="여자";
		return sqlSession.selectOne("mapper.admin.member.selectAllMemberWomen",gender);
	}
	@Override
	public int totalAllMember() {
		return sqlSession.selectOne("mapper.admin.member.totalAllMember");
	}
	@Override
	public int totalAllNonMember() {
		return sqlSession.selectOne("mapper.admin.member.totalAllNonMember");
	}
	@Override
	public int selectedMembers(Map<String, Object> pagingMap) {
		return sqlSession.selectOne("mapper.admin.member.selectedMembers",pagingMap);
	}
	


	


}
