package com.my.spring.admin.member.dao;



import java.util.List;
import java.util.Map;

import com.my.spring.member.vo.MemberVO;

public interface AdminMemberDAO  {


		void deleteMember(String member_code);

		int selectTotalMembers();

		List<MemberVO> selectAllMembersList(Map pagingMap);

		MemberVO selectMemberByCertain(Map searchMap);

		int selectAllMemberMen();

		int selectAllMemberWomen();

		int totalAllMember();

		int totalAllNonMember();

		int selectedMembers(Map<String, Object> pagingMap);




		
}
