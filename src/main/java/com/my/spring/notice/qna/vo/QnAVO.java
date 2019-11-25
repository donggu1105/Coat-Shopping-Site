package com.my.spring.notice.qna.vo;

import java.sql.Date;
import org.springframework.stereotype.Component;

@Component("QnAVO")
public class QnAVO {
	
	private int q_index;
	private String q_title;
	private String q_option;
	private String member_id;
	private String q_content;
	private String q_file;
	private Date q_date;
	private int q_hit;
	private int q_group;
	private int q_step;
	private int q_indent;
	
	public int getQ_index() {
		return q_index;
	}
	public void setQ_index(int q_index) {
		this.q_index = q_index;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_option() {
		return q_option;
	}
	public void setQ_option(String q_option) {
		this.q_option = q_option;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_file() {
		return q_file;
	}
	public void setQ_file(String q_file) {
		this.q_file = q_file;
	}
	public Date getQ_date() {
		return q_date;
	}
	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
	public int getQ_hit() {
		return q_hit;
	}
	public void setQ_hit(int q_hit) {
		this.q_hit = q_hit;
	}
	public int getQ_group() {
		return q_group;
	}
	public void setQ_group(int q_group) {
		this.q_group = q_group;
	}
	public int getQ_step() {
		return q_step;
	}
	public void setQ_step(int q_step) {
		this.q_step = q_step;
	}
	public int getQ_indent() {
		return q_indent;
	}
	public void setQ_indent(int q_indent) {
		this.q_indent = q_indent;
	}
	
}
