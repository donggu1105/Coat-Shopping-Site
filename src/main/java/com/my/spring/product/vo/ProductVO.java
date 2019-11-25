package com.my.spring.product.vo;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component("productdetailVO")
public class ProductVO {

	
	private int pro_code;  
	private String pro_name; 
	private String pro_price;    
	private String pro_sale; 
	private String pro_salesrate;    
	private String pro_count;    
	private String pro_category;    
	private String pro_category_detail;   
	private Date pro_input_date;    
	private String pro_content;   
	private String pro_grade;   
	private Date pro_cre_date;   
	private String pro_country;  
	private String pro_material;  
	private String pro_origin;   
	private String pro_prec;
	private String pro_status;
	private String pro_imageFileName;
	
	
	
	//ADD - 11/16
	private String pro_color;
	private List<Map<String, Object>> pro_color_list;
	private List<Integer> index_list;

	
	public List<Integer> getIndex_list() {
		return index_list;
	}
	public void setIndex_list(List<Integer> index_list) {
		this.index_list = index_list;
	}
	public String getPro_color() {
		return pro_color;
	}
	public void setPro_color(String pro_color) {
		this.pro_color = pro_color;
	}
	public List<Map<String, Object>> getPro_color_list() {
		return pro_color_list;
	}
	public void setPro_color_list(List<Map<String, Object>> pro_color_list) {
		this.pro_color_list = pro_color_list;
	}
	public String getPro_imageFileName() {
		return pro_imageFileName;
	}
	public void setPro_imageFileName(String pro_imageFileName) {
		this.pro_imageFileName = pro_imageFileName;
	}
	public String getPro_status() {
		return pro_status;
	}
	public void setPro_status(String pro_status) {
		this.pro_status = pro_status;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_price() {
		return pro_price;
	}
	public void setPro_price(String pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_sale() {
		return pro_sale;
	}
	public void setPro_sale(String pro_sale) {
		this.pro_sale = pro_sale;
	}
	public String getPro_salesrate() {
		return pro_salesrate;
	}
	public void setPro_salesrate(String pro_salesrate) {
		this.pro_salesrate = pro_salesrate;
	}
	public String getPro_count() {
		return pro_count;
	}
	public void setPro_count(String pro_count) {
		this.pro_count = pro_count;
	}
	public String getPro_category() {
		return pro_category;
	}
	public void setPro_category(String pro_category) {
		this.pro_category = pro_category;
	}
	public String getPro_category_detail() {
		return pro_category_detail;
	}
	public void setPro_category_detail(String pro_category_detail) {
		this.pro_category_detail = pro_category_detail;
	}
	public Date getPro_input_date() {
		return pro_input_date;
	}
	public void setPro_input_date(Date pro_input_date) {
		this.pro_input_date = pro_input_date;
	}
	public String getPro_content() {
		return pro_content;
	}
	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}
	public String getPro_grade() {
		return pro_grade;
	}
	public void setPro_grade(String pro_grade) {
		this.pro_grade = pro_grade;
	}
	public Date getPro_cre_date() {
		return pro_cre_date;
	}
	public void setPro_cre_date(Date pro_cre_date) {
		this.pro_cre_date = pro_cre_date;
	}
	public String getPro_country() {
		return pro_country;
	}
	public void setPro_country(String pro_country) {
		this.pro_country = pro_country;
	}
	public String getPro_material() {
		return pro_material;
	}
	public void setPro_material(String pro_material) {
		this.pro_material = pro_material;
	}
	public String getPro_origin() {
		return pro_origin;
	}
	public void setPro_origin(String pro_origin) {
		this.pro_origin = pro_origin;
	}
	public String getPro_prec() {
		return pro_prec;
	}
	public void setPro_prec(String pro_prec) {
		this.pro_prec = pro_prec;
	}  
}
