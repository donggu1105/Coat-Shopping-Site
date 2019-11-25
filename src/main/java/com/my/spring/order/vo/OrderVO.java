package com.my.spring.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	
	 private String order_member_id;
	 private String order_member_name;
	 private int order_pro_quantity; 
	 private int order_price;
	 private int order_discount;
	 private String receiver;
	 private String receiver_hp1; 
	 private String receiver_hp2; 
	 private String receiver_hp3; 
	 private String receiver_tel1 ;
	 private String receiver_tel2; 
	 private String receiver_tel3; 
	 private String delivery_addr1;   
	 private String delivery_addr2;   
	 private String delivery_addr3;   
	 private String delivery_addr4;   
	 private String delivery_how;
	 private String delivery_status;
	 private String who_pay;
	 private String which_bank;
	 private String request_to_delivery; 
	 private String how_pay; 
	 private String company_name_of_card; 
	 private String  card_split; 
	 private Date date_pay; 
	 private int order_member_code; 
	 private int order_nonmember_code;
	 private int order_pro_detail_code;
	 private String order_imageFileName;
	 private String order_pro_name;
	 private int order_pro_code;
	 
	 //추가
	 private int order_code;
	 private int pro_code;
	 private String pro_imagefilename;
	 private String pro_name;
	 private String pro_color;
	 private String pro_size;
	 
	 
	 
	 public String getOrder_imageFileName() {
		return order_imageFileName;
	}
	public void setOrder_imageFileName(String order_imageFileName) {
		this.order_imageFileName = order_imageFileName;
	}
	public String getOrder_pro_name() {
		return order_pro_name;
	}
	public void setOrder_pro_name(String order_pro_name) {
		this.order_pro_name = order_pro_name;
	}
	public int getOrder_pro_code() {
		return order_pro_code;
	}
	public void setOrder_pro_code(int order_pro_code) {
		this.order_pro_code = order_pro_code;
	}
	public int getOrder_code() {
		return order_code;
	}
	public void setOrder_code(int order_code) {
		this.order_code = order_code;
	}
	public String getPro_imagefilename() {
		return pro_imagefilename;
	}
	public void setPro_imagefilename(String pro_imagefilename) {
		this.pro_imagefilename = pro_imagefilename;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public String getPro_color() {
		return pro_color;
	}
	public void setPro_color(String pro_color) {
		this.pro_color = pro_color;
	}
	public String getPro_size() {
		return pro_size;
	}
	public void setPro_size(String pro_size) {
		this.pro_size = pro_size;
	}
	public String getOrder_member_id() {
		return order_member_id;
	}
	public void setOrder_member_id(String order_member_id) {
		this.order_member_id = order_member_id;
	}
	public String getOrder_member_name() {
		return order_member_name;
	}
	public void setOrder_member_name(String order_member_name) {
		this.order_member_name = order_member_name;
	}
	public int getOrder_pro_quantity() {
		return order_pro_quantity;
	}
	public void setOrder_pro_quantity(int order_pro_quantity) {
		this.order_pro_quantity = order_pro_quantity;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getReceiver_hp1() {
		return receiver_hp1;
	}
	public void setReceiver_hp1(String receiver_hp1) {
		this.receiver_hp1 = receiver_hp1;
	}
	public String getReceiver_hp2() {
		return receiver_hp2;
	}
	public void setReceiver_hp2(String receiver_hp2) {
		this.receiver_hp2 = receiver_hp2;
	}
	public String getReceiver_hp3() {
		return receiver_hp3;
	}
	public void setReceiver_hp3(String receiver_hp3) {
		this.receiver_hp3 = receiver_hp3;
	}
	public String getReceiver_tel1() {
		return receiver_tel1;
	}
	public void setReceiver_tel1(String receiver_tel1) {
		this.receiver_tel1 = receiver_tel1;
	}
	public String getReceiver_tel2() {
		return receiver_tel2;
	}
	public void setReceiver_tel2(String receiver_tel2) {
		this.receiver_tel2 = receiver_tel2;
	}
	public String getReceiver_tel3() {
		return receiver_tel3;
	}
	public void setReceiver_tel3(String receiver_tel3) {
		this.receiver_tel3 = receiver_tel3;
	}
	public String getDelivery_how() {
		return delivery_how;
	}
	public void setDelivery_how(String delivery_how) {
		this.delivery_how = delivery_how;
	}
	
	public String getRequest_to_delivery() {
		return request_to_delivery;
	}
	public void setRequest_to_delivery(String request_to_delivery) {
		this.request_to_delivery = request_to_delivery;
	}
	public String getHow_pay() {
		return how_pay;
	}
	public void setHow_pay(String how_pay) {
		this.how_pay = how_pay;
	}
	public String getCompany_name_of_card() {
		return company_name_of_card;
	}
	public void setCompany_name_of_card(String company_name_of_card) {
		this.company_name_of_card = company_name_of_card;
	}
	public String getCard_split() {
		return card_split;
	}
	public void setCard_split(String card_split) {
		this.card_split = card_split;
	}
	public Date getDate_pay() {
		return date_pay;
	}
	public void setDate_pay(Date date_pay) {
		this.date_pay = date_pay;
	}
	public int getOrder_member_code() {
		return order_member_code;
	}
	public void setOrder_member_code(int order_member_code) {
		this.order_member_code = order_member_code;
	}
	public int getOrder_nonmember_code() {
		return order_nonmember_code;
	}
	public void setOrder_nonmember_code(int order_nonmember_code) {
		this.order_nonmember_code = order_nonmember_code;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public String getDelivery_addr1() {
		return delivery_addr1;
	}
	public void setDelivery_addr1(String delivery_addr1) {
		this.delivery_addr1 = delivery_addr1;
	}
	public String getDelivery_addr2() {
		return delivery_addr2;
	}
	public void setDelivery_addr2(String delivery_addr2) {
		this.delivery_addr2 = delivery_addr2;
	}
	public String getDelivery_addr3() {
		return delivery_addr3;
	}
	public void setDelivery_addr3(String delivery_addr3) {
		this.delivery_addr3 = delivery_addr3;
	}
	public String getDelivery_addr4() {
		return delivery_addr4;
	}
	public void setDelivery_addr4(String delivery_addr4) {
		this.delivery_addr4 = delivery_addr4;
	}
	public String getWho_pay() {
		return who_pay;
	}
	public void setWho_pay(String who_pay) {
		this.who_pay = who_pay;
	}
	public int getOrder_discount() {
		return order_discount;
	}
	public void setOrder_discount(int order_discount) {
		this.order_discount = order_discount;
	}
	public String getWhich_bank() {
		return which_bank;
	}
	public void setWhich_bank(String which_bank) {
		this.which_bank = which_bank;
	}
	public int getOrder_pro_detail_code() {
		return order_pro_detail_code;
	}
	public void setOrder_pro_detail_code(int order_pro_detail_code) {
		this.order_pro_detail_code = order_pro_detail_code;
	}
}
