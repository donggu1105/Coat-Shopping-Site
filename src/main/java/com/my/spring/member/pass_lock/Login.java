package com.my.spring.member.pass_lock;

import com.my.spring.member.nonmember.vo.NonMemberVO;
import com.my.spring.member.vo.MemberVO;

public class Login {
	
	
	private SHA256 sha;
	
	public MemberVO password_Lock(MemberVO vo) throws Exception {
		String pw1 = "";
		String pw2 = "";
		
		sha = SHA256.getInsatnce();
		//1차 암호화
		pw1 = sha.getSha256(vo.getMember_pwd().getBytes());
		//2차 암호화
		pw2 = BCrypt.hashpw(pw1, BCrypt.gensalt());
		
		vo.setMember_pwd(pw1);
		vo.setMember_pwd_lock(pw2);
		
		return vo;
	}
	//비회원 전용
	public NonMemberVO password_Lock_non(NonMemberVO vo)throws Exception{
		String pw1 = "";
		String pw2 = "";
		
		sha = SHA256.getInsatnce();
		
		pw1 = sha.getSha256(vo.getNonmember_pwd().getBytes());
		
		pw2 = BCrypt.hashpw(pw1, BCrypt.gensalt());
		
		vo.setNonmember_pwd(pw1);
		vo.setNonmember_pwd_lock(pw2);
		
		return vo;
	}
	
	public MemberVO password_Confirm(MemberVO vo , String password) throws Exception {
		String pw = "";
		
		sha = SHA256.getInsatnce();
		
		pw = sha.getSha256(password.getBytes());
		
		if(vo.getMember_pwd().equals(pw)) {
			
			if(BCrypt.hashpw(pw, vo.getMember_pwd_lock()).equals(vo.getMember_pwd_lock())) {
				return vo;//일치한다면 사용자의 정보 return
			}
		}else {}
		
		
		return new MemberVO();//비밀번호가 일치하지않을땐 값을 초기화 시켜서 return
	}
	
	public NonMemberVO password_Confirm_non(NonMemberVO vo , String password) throws Exception {
		String pw = "";
		
		sha = SHA256.getInsatnce();
		
		pw = sha.getSha256(password.getBytes());
		
		if(vo.getNonmember_pwd().equals(pw)) {
			
			if(BCrypt.hashpw(pw, vo.getNonmember_pwd_lock()).equals(vo.getNonmember_pwd_lock())) {
				return vo;//일치한다면 사용자의 정보 return
			}
		}else {}
		
		
		return new NonMemberVO();//비밀번호가 일치하지않을땐 값을 초기화 시켜서 return
	}
}
