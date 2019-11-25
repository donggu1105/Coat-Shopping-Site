package com.my.spring.member.vo;

import java.util.Date;

public class MemberDetailVO {
	   private int discount_per;
	   private int discount_won;
	   private String cpon_name;
	   private Date cpon_cre_date;
	   private Date cpon_del_date;
	   
	   public int getDiscount_per() {
	      return discount_per;
	   }
	   public void setDiscount_per(int discount_per) {
	      this.discount_per = discount_per;
	   }
	   public int getDiscount_won() {
	      return discount_won;
	   }
	   public void setDiscount_won(int discount_won) {
	      this.discount_won = discount_won;
	   }
	   public String getCpon_name() {
	      return cpon_name;
	   }
	   public void setCpon_name(String cpon_name) {
	      this.cpon_name = cpon_name;
	   }
	   public Date getCpon_cre_date() {
	      return cpon_cre_date;
	   }
	   public void setCpon_cre_date(Date cpon_cre_date) {
	      this.cpon_cre_date = cpon_cre_date;
	   }
	   public Date getCpon_del_date() {
	      return cpon_del_date;
	   }
	   public void setCpon_del_date(Date cpon_del_date) {
	      this.cpon_del_date = cpon_del_date;
	   }
	   

}
