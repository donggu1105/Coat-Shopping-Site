package com.my.spring.cart.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("CartVO")
public class CartVO {
	private int cart_pro_code;
	private int cart_pro_detail_code;
	private int cart_member_code;
	private int cart_nonmember_code;
	private int cart_pro_quantity;
	private String cart_pro_color;
	private String cart_pro_size;
	private int cart_pro_price;
	private String pro_imagefilename;
	private String pro_name;
	private int rn;
	private String rid;
	
	//ADD - 11/19
	private List<String> color_list;
	private List<String> size_list;
	
	
	public List<String> getColor_list() {
		return color_list;
	}
	public void setColor_list(List<String> color_list) {
		this.color_list = color_list;
	}
	public List<String> getSize_list() {
		return size_list;
	}
	public void setSize_list(List<String> size_list) {
		this.size_list = size_list;
	}
	public int getCart_pro_detail_code() {
		return cart_pro_detail_code;
	}
	public void setCart_pro_detail_code(int cart_pro_detail_code) {
		this.cart_pro_detail_code = cart_pro_detail_code;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
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
	public int getCart_pro_code() {
		return cart_pro_code;
	}
	public void setCart_pro_code(int cart_pro_code) {
		this.cart_pro_code = cart_pro_code;
	}
	public int getCart_member_code() {
		return cart_member_code;
	}
	public void setCart_member_code(int cart_member_code) {
		this.cart_member_code = cart_member_code;
	}
	public int getCart_nonmember_code() {
		return cart_nonmember_code;
	}
	public void setCart_nonmember_code(int cart_nonmember_code) {
		this.cart_nonmember_code = cart_nonmember_code;
	}
	public int getCart_pro_quantity() {
		return cart_pro_quantity;
	}
	public void setCart_pro_quantity(int cart_pro_quantity) {
		this.cart_pro_quantity = cart_pro_quantity;
	}
	public String getCart_pro_color() {
		return cart_pro_color;
	}
	public void setCart_pro_color(String cart_pro_color) {
		this.cart_pro_color = cart_pro_color;
	}
	public String getCart_pro_size() {
		return cart_pro_size;
	}
	public void setCart_pro_size(String cart_pro_size) {
		this.cart_pro_size = cart_pro_size;
	}
	public int getCart_pro_price() {
		return cart_pro_price;
	}
	public void setCart_pro_price(int cart_pro_price) {
		this.cart_pro_price = cart_pro_price;
	}
	

}
