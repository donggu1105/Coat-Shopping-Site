package com.my.spring.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("MemberVO")
public class MemberVO {
	private int member_code;
	private String member_id;
	private String member_pwd;
	private String member_pwd_lock;
	private String member_pwd_q;
	private String member_pwd_a;
	private String member_name;
	private String member_gender;
	private String member_cp1;
	private String member_cp2;
	private String member_cp3;
	private String member_hp1;
	private String member_hp2;
	private String member_hp3;
	private String member_cp_yn;
	private String member_email1;
	private String member_email2;
	private String member_email_yn;
	private String member_addr1;
	private String member_addr2;
	private String member_addr3;
	private String member_addr4;
	private String member_birth_y;
	private String member_birth_m;
	private String member_birth_d;
	private String member_birth_sl;
	private Date member_cre_date;
	private int member_point;
	private String member_rank;
	private Date member_lately_date;
	private int member_total_buy;
	private int member_total_order;
	private int member_saving;
	private int member_total_login;
	//ȸ������ ��ȸ������ ������ ����
	private boolean type;
	
	

	public int getMember_total_login() {
		return member_total_login;
	}

	public void setMember_total_login(int member_total_login) {
		this.member_total_login = member_total_login;
	}

	public int getMember_saving() {
		return member_saving;
	}

	public void setMember_saving(int member_saving) {
		this.member_saving = member_saving;
	}

	public boolean isType() {
		return type;
	}

	public void setType(boolean type) {
		this.type = type;
	}

	public Date getMember_lately_date() {
		return member_lately_date;
	}

	public void setMember_lately_date(Date member_lately_date) {
		this.member_lately_date = member_lately_date;
	}

	public int getMember_total_buy() {
		return member_total_buy;
	}

	public void setMember_total_buy(int member_total_buy) {
		this.member_total_buy = member_total_buy;
	}

	public int getMember_total_order() {
		return member_total_order;
	}

	public void setMember_total_order(int member_total_order) {
		this.member_total_order = member_total_order;
	}

	public int getMember_code() {
		return member_code;
	}

	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_pwd_lock() {
		return member_pwd_lock;
	}

	public void setMember_pwd_lock(String member_pwd_lock) {
		this.member_pwd_lock = member_pwd_lock;
	}

	public String getMember_pwd_q() {
		return member_pwd_q;
	}

	public void setMember_pwd_q(String member_pwd_q) {
		this.member_pwd_q = member_pwd_q;
	}

	public String getMember_pwd_a() {
		return member_pwd_a;
	}

	public void setMember_pwd_a(String member_pwd_a) {
		this.member_pwd_a = member_pwd_a;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_cp1() {
		return member_cp1;
	}

	public void setMember_cp1(String member_cp1) {
		this.member_cp1 = member_cp1;
	}

	public String getMember_cp2() {
		return member_cp2;
	}

	public void setMember_cp2(String member_cp2) {
		this.member_cp2 = member_cp2;
	}

	public String getMember_cp3() {
		return member_cp3;
	}

	public void setMember_cp3(String member_cp3) {
		this.member_cp3 = member_cp3;
	}

	public String getMember_hp1() {
		return member_hp1;
	}

	public void setMember_hp1(String member_hp1) {
		this.member_hp1 = member_hp1;
	}

	public String getMember_hp2() {
		return member_hp2;
	}

	public void setMember_hp2(String member_hp2) {
		this.member_hp2 = member_hp2;
	}

	public String getMember_hp3() {
		return member_hp3;
	}

	public void setMember_hp3(String member_hp3) {
		this.member_hp3 = member_hp3;
	}

	public String getMember_cp_yn() {
		return member_cp_yn;
	}

	public void setMember_cp_yn(String member_cp_yn) {
		this.member_cp_yn = member_cp_yn;
	}

	public String getMember_email1() {
		return member_email1;
	}

	public void setMember_email1(String member_email1) {
		this.member_email1 = member_email1;
	}

	public String getMember_email2() {
		return member_email2;
	}

	public void setMember_email2(String member_email2) {
		this.member_email2 = member_email2;
	}

	public String getMember_email_yn() {
		return member_email_yn;
	}

	public void setMember_email_yn(String member_email_yn) {
		this.member_email_yn = member_email_yn;
	}

	public String getMember_addr1() {
		return member_addr1;
	}

	public void setMember_addr1(String member_addr1) {
		this.member_addr1 = member_addr1;
	}

	public String getMember_addr2() {
		return member_addr2;
	}

	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}

	public String getMember_addr3() {
		return member_addr3;
	}

	public void setMember_addr3(String member_addr3) {
		this.member_addr3 = member_addr3;
	}

	public String getMember_addr4() {
		return member_addr4;
	}

	public void setMember_addr4(String member_addr4) {
		this.member_addr4 = member_addr4;
	}

	public String getMember_birth_y() {
		return member_birth_y;
	}

	public void setMember_birth_y(String member_birth_y) {
		this.member_birth_y = member_birth_y;
	}

	public String getMember_birth_m() {
		return member_birth_m;
	}

	public void setMember_birth_m(String member_birth_m) {
		this.member_birth_m = member_birth_m;
	}

	public String getMember_birth_d() {
		return member_birth_d;
	}

	public void setMember_birth_d(String member_birth_d) {
		this.member_birth_d = member_birth_d;
	}

	public Date getMember_cre_date() {
		return member_cre_date;
	}

	public void setMember_cre_date(Date member_cre_date) {
		this.member_cre_date = member_cre_date;
	}

	public String getMember_rank() {
		return member_rank;
	}

	public int getMember_point() {
		return member_point;
	}

	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}

	public void setMember_rank(String member_rank) {
		this.member_rank = member_rank;
	}

	public String getMember_birth_sl() {
		return member_birth_sl;
	}

	public void setMember_birth_sl(String member_birth_sl) {
		this.member_birth_sl = member_birth_sl;
	}

	public void setMember_code(Integer member_code) {
		this.member_code = member_code;
	}

	@Override
	public String toString() {
		return member_code + "\n" + member_id + "\n" + member_pwd + "\n" + member_pwd_lock + "\n" + member_pwd_q + "\n"
				+ member_pwd_a + "\n" + member_name + "\n" + member_gender + "\n" + member_cp1 + "\n" + member_cp2
				+ "\n" + member_cp3 + "\n" + member_hp1 + "\n" + member_hp2 + "\n" + member_hp3 + "\n" + member_addr1
				+ "\n" + member_addr2 + "\n" + member_addr3 + "\n" + member_addr4 + "\n" + member_birth_y + "\n"
				+ member_birth_m + "\n" + member_birth_d + "\n" + member_birth_sl;
	}

}
