package com.my.spring.order.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.my.spring.cart.vo.CartVO;
import com.my.spring.member.vo.MemberDetailVO;
import com.my.spring.order.vo.OrderVO;

public interface OrderService {

	Map<String, Object> cartList(Map<String, Object> orderMap);

	int order(Map<String, Object> orderMap);

	int getSequence();





}
