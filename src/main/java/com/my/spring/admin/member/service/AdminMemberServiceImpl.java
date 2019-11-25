package com.my.spring.admin.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.admin.member.dao.AdminMemberDAO;
import com.my.spring.cart.dao.CartDAO;
import com.my.spring.cart.vo.CartVO;
import com.my.spring.member.dao.MemberDAO;
import com.my.spring.member.vo.MemberVO;
import com.my.spring.order.dao.OrderDAO;
import com.my.spring.order.vo.OrderVO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	AdminMemberDAO adminMemberDAO;
	@Autowired
	MemberVO memberVO;
	@Autowired
	MemberDAO memberDAO;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	CartDAO cartDAO;
	

	@Override
	public Map<String,Object> listMembers(Map<String,Object> pagingMap) {
		
		Map<String,Object> membersMap=new HashMap();
		
		int allMen,allWomen,allMember,allNonMember=0;
		List<MemberVO> membersList=null;
		//남자회원수 가져오기
		allMen=adminMemberDAO.selectAllMemberMen();
		//여자회원수 가져오기
		allWomen=adminMemberDAO.selectAllMemberWomen();
		allMember=adminMemberDAO.totalAllMember();
		allNonMember=adminMemberDAO.totalAllNonMember();
		membersList=adminMemberDAO.selectAllMembersList(pagingMap); //MemberList가져옴
		int totMembers=adminMemberDAO.selectTotalMembers(); //총 멤버수가져옴 
		int selectedMembers=adminMemberDAO.selectedMembers(pagingMap);
		System.out.println("selectedMembers : "+selectedMembers);
		membersMap.put("membersList", membersList);
		membersMap.put("totMembers", totMembers);
		membersMap.put("allMen", allMen);
		membersMap.put("allWomen", allWomen);
		membersMap.put("allMember", allMember);
		membersMap.put("allNonMember", allNonMember);
		membersMap.put("selectedMembers", selectedMembers);
		return membersMap;
	}
	

	@Override
	public void deleteMember(String member_code) {
		adminMemberDAO.deleteMember(member_code);
	}


	@Override
	public Map<String, Object> viewMember(Map searchMap) {
		
		Map<String,Object> returnMap=new HashMap();//returnMap 생성
		int averageOrder=0;
		String onDelivery=null;
		String onCart=null;
		String onRefund=null;
		List<CartVO> cartList=null;
		List<OrderVO> orderList=null;
		List<OrderVO> refundList=null;
		Map<String,Object> orderReturn =new HashMap();
		Map<String,Object> refundReturn=new HashMap();
		MemberVO member=adminMemberDAO.selectMemberByCertain(searchMap);//member관련정보 따오기
		int member_code=member.getMember_code(); //가져온 멤버에서 멤버코드가져오기
		System.out.println("member_code :"+member_code);
		int totalCoupons=memberDAO.selectAllCoupons(member_code); //쿠폰갯수따오기
		 //주문한 이력 있으면
		String orderFlag=orderDAO.haveOrdered(member_code);
		System.out.println("orderFlag :"+orderFlag);
		if(orderFlag.equals("true")) {
			averageOrder=orderDAO.selectAverageOrder(member_code);
			//배송중인 상품 검색
			onDelivery=orderDAO.onDelivery(member_code);
			System.out.println("onDelivery :"+onDelivery);
			orderReturn.put("code", member_code);
			orderReturn.put("col", "member");
			orderReturn.put("delivery_status", "배송중");
			 orderList=orderDAO.get_OrderList(orderReturn); 
		}
		refundReturn.put("code", member_code);
		refundReturn.put("col", "member");
		refundReturn.put("delivery_status","반품대기중");
		String refundFlag=orderDAO.haveRefunded(refundReturn);
		System.out.println("refundFlag :"+refundFlag);
		if(refundFlag.equals("true")) {
			onRefund=orderDAO.onRefund(refundReturn);
			System.out.println("onRefund"+onRefund);
			
			 refundList=orderDAO.get_OrderList(refundReturn); 
		}
		//장바구니에 담은 상품있으면
		String cartFlag=cartDAO.flagInCart(member_code);
		System.out.println("cartFlag :"+cartFlag);
		if(cartFlag.equals("true")) {
			onCart=cartDAO.onCart(member_code);
			cartList=cartDAO.cartListByMember_code(member_code);
		}
		
		
		
		
		returnMap.put("member", member);
		returnMap.put("totalCoupons", totalCoupons);
		returnMap.put("averageOrder", averageOrder);
		returnMap.put("onDelivery", onDelivery);
		returnMap.put("onCart", onCart);
		returnMap.put("onRefund", onRefund);
		returnMap.put("cartList", cartList);
		returnMap.put("orderList", orderList);
		returnMap.put("refundList", refundList);
		
		
		
		return returnMap;
	}


	@Override
	public Map<String, Object> getMemberStatics() {
		//초기화
		Map<String,Object> viewMap=new HashMap();
		int memberMen,memberWomen,totalMember,totalNonMember=0;
		
		//남자회원수 가져오기
		memberMen=adminMemberDAO.selectAllMemberMen();
		//여자회원수 가져오기
		memberWomen=adminMemberDAO.selectAllMemberWomen();
		totalMember=adminMemberDAO.totalAllMember();
		totalNonMember=adminMemberDAO.totalAllNonMember();
		
		
		viewMap.put("memberMen", memberMen);
		viewMap.put("memberWomen", memberWomen);
		viewMap.put("totalMember", totalMember);
		viewMap.put("totalNonMember", totalNonMember);
		return viewMap;
	}


	





	
	
	
}
