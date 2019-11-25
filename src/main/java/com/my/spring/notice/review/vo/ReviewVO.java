package com.my.spring.notice.review.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {
	
	private int pro_code;  //����ڵ�
	
	private int review_num; //�۹�ȣ
	private String pro_name; //��ǰ�̸�
	private String member_id;
	private String review_title; //��������
	private String review_content; //���䳻��
	private Date review_date; //�۾���¥
	
	private int review_hit; //��ȸ��
	private int review_replyCount; //���°���
	
	private int review_star; //����
	
	private String review_imageFileName;

	public int getPro_code() {
		return pro_code;
	}

	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getReview_hit() {
		return review_hit;
	}

	public void setReview_hit(int review_hit) {
		this.review_hit = review_hit;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getReview_replyCount() {
		return review_replyCount;
	}

	public void setReview_replyCount(int review_replyCount) {
		this.review_replyCount = review_replyCount;
	}

	public String getReview_imageFileName() {
		return review_imageFileName;
	}

	public void setReview_imageFileName(String review_imageFileName) {
		this.review_imageFileName = review_imageFileName;
	}

	
}
