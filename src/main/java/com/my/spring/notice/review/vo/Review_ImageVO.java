package com.my.spring.notice.review.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("review_ImageVO")
public class Review_ImageVO {
	
	private int pro_code; //foreign key 
	private int review_num; //foreign key 
	private int review_image_code;
	private String review_imageFileName;
	private Date review_image_cre_date;
	private int review_image_seq;
	
	
	
	public int getReview_image_seq() {
		return review_image_seq;
	}
	public void setReview_image_seq(int review_image_seq) {
		this.review_image_seq = review_image_seq;
	}
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
	public int getReview_image_code() {
		return review_image_code;
	}
	public void setReview_image_code(int review_image_code) {
		this.review_image_code = review_image_code;
	}
	public String getReview_imageFileName() {
		return review_imageFileName;
	}
	public void setReview_imageFileName(String review_imageFileName) {
		this.review_imageFileName = review_imageFileName;
	}
	public Date getReview_image_cre_date() {
		return review_image_cre_date;
	}
	public void setReview_image_cre_date(Date review_image_cre_date) {
		this.review_image_cre_date = review_image_cre_date;
	}
	
	
	
}
