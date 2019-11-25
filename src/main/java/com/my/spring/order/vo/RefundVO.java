package com.my.spring.order.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("refundVO")
public class RefundVO {

	
			private int refund_code;
			private String refund_name ;
			private String refund_reason ;
			private String refund_accept_YN ;
			private Date refund_accept_date ;
			private Date refund_date ;
			private String how_refund ;
			private int pro_detail_code; 
			private int order_code;
			
			public int getRefund_code() {
				return refund_code;
			}
			public void setRefund_code(int refund_code) {
				this.refund_code = refund_code;
			}
			public String getRefund_name() {
				return refund_name;
			}
			public void setRefund_name(String refund_name) {
				this.refund_name = refund_name;
			}
			public String getRefund_reason() {
				return refund_reason;
			}
			public void setRefund_reason(String refund_reason) {
				this.refund_reason = refund_reason;
			}
			public String getRefund_accept_YN() {
				return refund_accept_YN;
			}
			public void setRefund_accept_YN(String refund_accept_YN) {
				this.refund_accept_YN = refund_accept_YN;
			}
			public Date getRefund_accept_date() {
				return refund_accept_date;
			}
			public void setRefund_accept_date(Date refund_accept_date) {
				this.refund_accept_date = refund_accept_date;
			}
			public Date getRefund_date() {
				return refund_date;
			}
			public void setRefund_date(Date refund_date) {
				this.refund_date = refund_date;
			}
			public String getHow_refund() {
				return how_refund;
			}
			public void setHow_refund(String how_refund) {
				this.how_refund = how_refund;
			}
			public int getPro_detail_code() {
				return pro_detail_code;
			}
			public void setPro_detail_code(int pro_detail_code) {
				this.pro_detail_code = pro_detail_code;
			}
			public int getOrder_code() {
				return order_code;
			}
			public void setOrder_code(int order_code) {
				this.order_code = order_code;
			} 
}
