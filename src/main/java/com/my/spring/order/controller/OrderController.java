package com.my.spring.order.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.spring.cart.vo.CartVO;
import com.my.spring.member.nonmember.vo.NonMemberVO;
import com.my.spring.member.vo.MemberDetailVO;
import com.my.spring.member.vo.MemberVO;
import com.my.spring.order.service.OrderService;
import com.my.spring.order.vo.OrderVO;

@Controller("orderController")
@RequestMapping("/order")
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@RequestMapping(value="/orderMain.do")
	public ModelAndView orderMain (HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="cart_pro_detail_code", required=false) String cart_pro_detail_code, //�ٷα��� ������� pro_code
			@RequestParam(value="pro_detail_code_list", required=false) List<Integer> cart_pro_detail_code_list  //pro_code list�ΰ�������
			) {
			
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView();
		Map<String,Object> orderMap=new HashMap<String,Object>(); //orderList �ҷ��� parameterMap ����
		HttpSession session=request.getSession();
		
		
		if((Boolean)session.getAttribute("isLogOn")) {
			MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
			orderMap.put("table", "member");
			orderMap.put("code", vo.getMember_code());
		}else if((Boolean)session.getAttribute("NonisLogOn")) {
			NonMemberVO vo = (NonMemberVO)session.getAttribute("nonmemberInfo");
			orderMap.put("table", "nonmember");
			orderMap.put("code", vo.getNonmember_code());
		}
		
		//�ٷα��� ���������
		if(cart_pro_detail_code!=null) {
			session.removeAttribute("cart_pro_detail_code_list");
			orderMap.put("cart_pro_detail_code", cart_pro_detail_code);
			session.setAttribute("cart_pro_detail_code", cart_pro_detail_code);
			
		}
		//īƮ���� �����ð��
		if(cart_pro_detail_code_list !=null) {
			session.removeAttribute("cart_pro_detail_code");
			orderMap.put("order_pro_detail_code_list", cart_pro_detail_code_list);
			session.setAttribute("cart_pro_detail_code_list", cart_pro_detail_code_list);
		}
		
		Map<String,Object> orderViewMap=orderService.cartList(orderMap); //cartList���� orderList�� �ҷ����� 
	
		
		mav.addObject("orderViewMap", orderViewMap);
		mav.setViewName(viewName);
		return mav;
		
	}
		
	
	@RequestMapping(value="/order.do", method=RequestMethod.POST)
	public ResponseEntity order (HttpServletRequest request, HttpServletResponse response) {
		
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders=new HttpHeaders();
		Map<String,Object> orderMap=new HashMap();
		HttpSession session=request.getSession();
		List<Integer> detailList=null;

		if(session.getAttribute("memberInfo") !=null) { //회원로그인중이면 세션에 저장된 회원관한 정보 가져오기
			MemberVO vo=(MemberVO) session.getAttribute("memberInfo");
			
			int order_member_code =vo.getMember_code(); //회원 code값 가져오기
			String order_member_id=vo.getMember_id();  //회원 id값 가져오기
			String order_member_name=vo.getMember_name();//회원 name값 가져오기
			int member_point=vo.getMember_point(); //회원 포인트
			int member_saving=vo.getMember_saving(); //회원 적립금
			int order_member_total_buy=vo.getMember_total_buy(); //회원 지금까지 총 주문금액
			int order_member_total_order=vo.getMember_total_order(); // 회원 지금까지 오더횟수
			
			orderMap.put("order_member_code", order_member_code);
			orderMap.put("order_member_id", order_member_id);
			orderMap.put("order_member_name", order_member_name);
			orderMap.put("member_point", member_point);
			orderMap.put("member_saving", member_saving);
			orderMap.put("order_member_total_buy", order_member_total_buy);
			orderMap.put("order_member_total_order", order_member_total_order);
			
			if(session.getAttribute("cart_pro_detail_code") !=null ) {
				orderMap.put("order_pro_detail_code", session.getAttribute("cart_pro_detail_code"));
			}
			
			if(session.getAttribute("cart_pro_detail_code_list")!=null){
				orderMap.put("cart_pro_detail_code_list", session.getAttribute("cart_pro_detail_code_list"));
				detailList=(List<Integer>)session.getAttribute("cart_pro_detail_code_list");
			}
			
			
		}else if(session.getAttribute("nonMemberInfo") !=null) {//비회원 로그인중이면 세션에 저장된 비회원 관한 정보 가져오기
			NonMemberVO vo=(NonMemberVO)session.getAttribute("nonMemberInfo");
			
			int order_member_code=vo.getNonmember_code(); //비회원 code값 가져오기
			String order_member_id=vo.getNonmember_id();  //비회원 id값 가져오기
			
			orderMap.put("order_member_code", order_member_code);
			orderMap.put("order_member_id", order_member_id);
	
			
			if(session.getAttribute("cart_pro_detail_code") !=null ) {
				orderMap.put("order_pro_detail_code", session.getAttribute("cart_pro_detail_code"));
			}
			
			if(session.getAttribute("cart_pro_detail_code_list")!=null){
				orderMap.put("cart_pro_detail_code_list", session.getAttribute("cart_pro_detail_code_list"));
			}
			
		}
		Enumeration enu =request.getParameterNames();
		List<Map<String,Object>> orderList=new ArrayList<Map<String,Object>>();
		int order_code=orderService.getSequence();
		
		if(detailList != null) {
			
		for(int i =0 ; i < detailList.size(); i ++) {
			Map<String, Object> detailMap = new HashMap<String, Object>();
			detailMap.put("pro_detail_code", detailList.get(i));
			detailMap.put("pro_detail_code_quantity", request.getParameter(detailList.get(i)+"quantity"));
			detailMap.put("pro_detail_code_price", request.getParameter(detailList.get(i)+"price"));
			detailMap.put("seq_order_id", order_code);
			orderList.add(detailMap);
			}
		}
		while(enu.hasMoreElements()) {
			String name=(String)enu.nextElement();
			String value=(String)request.getParameter(name);
			System.out.println("name :"+name+" value :"+value);
			orderMap.put(name, value);
			}
		orderMap.put("orderList", orderList);
		System.out.println(orderList);
		System.out.println("orderList size()" + orderList.size());
		orderService.order(orderMap);
		
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message = "<script>";
		message += " alert('주문을 완료했습니다.');";
		message += " location.href='"+request.getContextPath()+"/main/main.do'; ";
		message +=" </script>";
	    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		
		return resEnt;
		
		
		
	}
}
