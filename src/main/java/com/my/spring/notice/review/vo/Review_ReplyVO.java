package com.my.spring.notice.review.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("review_ReplyVO")
public class Review_ReplyVO {
	
	private int review_num;
	private String member_id;
	private String review_replyContent;
	private Date review_replyDate;
	private int review_reply_code;
	
	
	
	public int getReview_reply_code() {
		return review_reply_code;
	}
	public void setReview_reply_code(int review_reply_code) {
		this.review_reply_code = review_reply_code;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getReview_replyContent() {
		return review_replyContent;
	}
	public void setReview_replyContent(String review_replyContent) {
		this.review_replyContent = review_replyContent;
	}
	public Date getReview_replyDate() {
		return review_replyDate;
	}
	public void setReview_replyDate(Date review_replyDate) {
		this.review_replyDate = review_replyDate;
	}
	
	
	
	
	
}
