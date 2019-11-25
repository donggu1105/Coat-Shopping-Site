package com.my.spring.admin.order.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.spring.admin.order.service.AdminOrderService;

@Controller("adminOrderController")
@RequestMapping("admin/order")
public class AdminOrderController {

	@Autowired
	AdminOrderService adminOrderService;
	
	
	
	@RequestMapping(value="/listOrders.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView listOrders (HttpServletRequest request, HttpServletResponse reponse,
							@RequestParam(value="member_code" , required=false) String order_code,
							@RequestParam(value="section", required=false) String _section,
							@RequestParam(value="pageNum", required=false) String _pageNum,
							@RequestParam(value="direct_delivery_status", required=false) String direct_delivery_status,
							@RequestParam(value="total", required=false) String total,
							@RequestParam(value="order_member_name", required=false) String order_member_name,
							@RequestParam(value="delivery_status", required=false) String delivery_status,
							@RequestParam(value="order_price", required=false) String order_price,
							@RequestParam(value="delivery_how", required=false) String delivery_how,
							@RequestParam(value="how_pay", required=false) String how_pay,
							@RequestParam(value="how_pay2", required=false) String how_pay2,
							@RequestParam(value="change_delivery_status", required=false) String change_delivery_status,
							@RequestParam(value="change_detail_code", required=false) String change_detail_code
			) {
		
		HttpSession session=request.getSession();
		if(session.getAttribute("side_menu") !=null){
			session.removeAttribute("side_menu");
		}
		session.setAttribute("side_menu", "side_order");
		String viewName=(String)request.getAttribute("viewName");
		
		ModelAndView mav=new ModelAndView();
		Map<String,Object> pagingMap=new HashMap();
	
 
		
		int section=Integer.parseInt((_section==null)? "1" : _section);
		int pageNum=Integer.parseInt((_pageNum==null)? "1" : _pageNum);
		
		//배송상태 수정하기
		if(change_delivery_status !=null) {
			System.out.println("change_delivery_status :"+change_delivery_status);
			System.out.println("change_detail_code :"+change_detail_code);
			adminOrderService.changeDelivery(change_delivery_status, change_detail_code);
		}
		
		pagingMap.put("order_code", order_code);
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("direct_delivery_status", direct_delivery_status);
		pagingMap.put("total", total);
		pagingMap.put("order_member_name", order_member_name);
		pagingMap.put("delivery_status", delivery_status);
		pagingMap.put("order_price", order_price);
		pagingMap.put("delivery_how", delivery_how);
		pagingMap.put("how_pay", how_pay);
		pagingMap.put("how_pay2", how_pay2);
		
		System.out.println("order_code :"+order_code);
		System.out.println("section :"+section);
		System.out.println("pageNum :"+pageNum);
		System.out.println("direct_delivery_status :"+direct_delivery_status);
		System.out.println("total :"+total);
		System.out.println("order_member_name :"+order_member_name);
		System.out.println("delivery_status :"+delivery_status);
		System.out.println("order_price :"+order_price);
		System.out.println("delivery_how :"+delivery_how);
		System.out.println("how_pay :"+how_pay);
		System.out.println("how_pay2 :"+how_pay2);
		if(how_pay2 !=null) {
			
		if(how_pay2.indexOf("카드")>-1) {
			System.out.println("카드신호");
			pagingMap.put("how_pay2_way", "card");
		}else {
			System.out.println("은행신호");
			pagingMap.put("how_pay2_way", "bank");
		}
		
		}
		Map<String,Object> viewMap=adminOrderService.getOrderList(pagingMap);
		
		
		viewMap.put("order_code", order_code);
		viewMap.put("section", section);
		viewMap.put("pageNum", pageNum);
		viewMap.put("direct_delivery_status", direct_delivery_status);
		viewMap.put("total", total);
		viewMap.put("order_member_name", order_member_name);
		viewMap.put("delivery_status", delivery_status);
		viewMap.put("order_price", order_price);
		viewMap.put("delivery_how", delivery_how);
		viewMap.put("how_pay", how_pay);
		viewMap.put("how_pay2", how_pay2);
		
		mav.setViewName(viewName);
		mav.addObject("viewMap",viewMap);
		return mav;
		
		
	}
	
	@RequestMapping(value="/orderStatics.do" , method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView searchMember (HttpServletRequest request, HttpServletResponse response) {
		
		
	ModelAndView mav=new ModelAndView();
	String viewName=(String)request.getAttribute("viewName");
	
	
	Map<String,Object> viewMap=adminOrderService.getOrderStatics();
	
	
	
	mav.addObject("viewMap",viewMap);
	mav.setViewName(viewName);
	return mav;		
	
	
}
	@RequestMapping(value="/requestRefund.do", method= {RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity requestRefund(HttpServletRequest request, HttpServletResponse response,
							@RequestParam(value="order_code") String order_code,
							@RequestParam(value="pro_detail_code") String pro_detail_code,
							@RequestParam(value="refund_name") String refund_name
							
			) {
		System.out.println("order_code : "+order_code);
		System.out.println("pro_detail_code : "+pro_detail_code);
		System.out.println("refund_name : "+refund_name);
		Map<String,Object> requestMap=new HashMap();
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		requestMap.put("order_code", order_code);
		requestMap.put("pro_detail_code", pro_detail_code);
		requestMap.put("refund_name", refund_name);
		
		adminOrderService.addRefund(requestMap);
		
		String message="<script> ";
		message+=" alert('반품요청을 접수했습니다.2');";
		message+=" location.href='"+request.getContextPath()+"/mypage/memberInfo_orderList.do';";
		message+=" </script>";
		
		resEnt=new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		
		return resEnt;
		
		
		
	}
	
}
