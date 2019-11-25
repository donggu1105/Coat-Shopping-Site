package com.my.spring.product.vo;

import java.sql.Date;

public class ImageFileVO {

	private int pro_code;
	private int pro_image_code;
	private String pro_imageFileName;
	private String pro_imageFileType;
	private String pro_register;
	private Date pro_image_cre_date;
	
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public int getPro_image_code() {
		return pro_image_code;
	}
	public void setPro_image_code(int pro_image_code) {
		this.pro_image_code = pro_image_code;
	}
	public String getPro_imageFileName() {
		return pro_imageFileName;
	}
	public void setPro_imageFileName(String pro_imageFileName) {
		this.pro_imageFileName = pro_imageFileName;
	}
	public String getPro_imageFileType() {
		return pro_imageFileType;
	}
	public void setPro_imageFileType(String pro_imageFileType) {
		this.pro_imageFileType = pro_imageFileType;
	}
	public String getPro_register() {
		return pro_register;
	}
	public void setPro_register(String pro_register) {
		this.pro_register = pro_register;
	}
	public Date getPro_image_cre_date() {
		return pro_image_cre_date;
	}
	public void setPro_image_cre_date(Date pro_image_cre_date) {
		this.pro_image_cre_date = pro_image_cre_date;
	}
}
