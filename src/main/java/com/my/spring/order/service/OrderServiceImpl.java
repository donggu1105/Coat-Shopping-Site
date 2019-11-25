package com.my.spring.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.cart.dao.CartDAO;
import com.my.spring.cart.vo.CartVO;
import com.my.spring.member.dao.MemberDAO;
import com.my.spring.member.vo.MemberDetailVO;
import com.my.spring.order.dao.OrderDAO;
import com.my.spring.product.dao.ProductDAO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDAO;
	
	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	ProductDAO productDAO;

	@Override
	public Map<String, Object> cartList(Map orderMap) { 
		
		Map<String,Object> orderViewMap=new HashMap<String,Object>();
		
			int member_code=(Integer)orderMap.get("code");
			MemberDetailVO memberDetail=memberDAO.selectMemberDetail(member_code); //MemberDetail 가져오기
			int total_coupons=memberDAO.selectAllCoupons(member_code);
			orderViewMap.put("total_coupons", total_coupons);
			orderViewMap.put("memberDetail", memberDetail);
		
		List<CartVO> orderList=cartDAO.CartList(orderMap); //cartList 가져오기
		
		orderViewMap.put("orderList", orderList);
		
		
		return orderViewMap;
	}

	@Override
	public int order(Map<String, Object> orderMap) {
		Map<String,Object> deleteMap=new HashMap<String,Object>();
		ArrayList<Integer> deleteList=new ArrayList<Integer>();
		//멤버일때
		deleteMap.put("col", "member");
		deleteMap.put("code", orderMap.get("order_member_code"));
		//카트에서 지우기
		if(orderMap.get("order_pro_detail_code") !=null) {
			deleteList.add(Integer.parseInt((String) orderMap.get("order_pro_detail_code")));
		}else if(orderMap.get("cart_pro_detail_code_list") != null) {
			deleteList=(ArrayList<Integer>) orderMap.get("cart_pro_detail_code_list");
		}
		deleteMap.put("pro_detail_code_list", deleteList);
		cartDAO.DeleteCart(deleteMap);
		
		//멤버에 주문금액넣기,주문횟수 늘리기,쓴적립금뺴고 새로운적립금 넣기
		memberDAO.updateMemberOrder(orderMap);
		
		return orderDAO.insertNewOrder(orderMap);
		
		
		
	}

	@Override
	public int getSequence() {
		return orderDAO.seq_order_id_nextval();
	}
	
	
	

}
