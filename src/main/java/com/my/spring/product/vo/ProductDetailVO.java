package com.my.spring.product.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("productDetailVO")
public class ProductDetailVO {
   
   private int pro_code;
   private int pro_detail_code;
   private String pro_size;
   private String pro_color;
   private int pro_quantity;
   private String pro_category_detail;
   private Date pro_restocked_date;
   private char pro_restocked_yn;
   
   
   
   public int getPro_detail_code() {
	return pro_detail_code;
}
public void setPro_detail_code(int pro_detail_code) {
	this.pro_detail_code = pro_detail_code;
}
public int getPro_code() {
      return pro_code;
   }
   public void setPro_code(int pro_code) {
      this.pro_code = pro_code;
   }
   public String getPro_size() {
      return pro_size;
   }
   public void setPro_size(String pro_size) {
      this.pro_size = pro_size;
   }
   public String getPro_color() {
      return pro_color;
   }
   public void setPro_color(String pro_color) {
      this.pro_color = pro_color;
   }
   public int getPro_quantity() {
      return pro_quantity;
   }
   public void setPro_quantity(int pro_quantity) {
      this.pro_quantity = pro_quantity;
   }
   public String getPro_category_detail() {
      return pro_category_detail;
   }
   public void setPro_category_detail(String pro_category_detail) {
      this.pro_category_detail = pro_category_detail;
   }
public Date getPro_restocked_date() {
	return pro_restocked_date;
}
public void setPro_restocked_date(Date pro_restocked_date) {
	this.pro_restocked_date = pro_restocked_date;
}
public char getPro_restocked_yn() {
	return pro_restocked_yn;
}
public void setPro_restocked_yn(char pro_restocked_yn) {
	this.pro_restocked_yn = pro_restocked_yn;
}
   
   
}