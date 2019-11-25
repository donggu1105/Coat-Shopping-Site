package com.my.spring.order.dao;

import java.util.List;
import java.util.Map;

import com.my.spring.order.vo.OrderVO;

public interface OrderDAO {

	int insertNewOrder(Map<String, Object> orderMap);
	int selectAverageOrder(int member_code);

	String haveOrdered(int member_code);

	String onDelivery(int member_code);

	List<OrderVO> selectOrderList(int member_code);

	int seq_order_id_nextval();
	//ADD
	List<Integer> order_Code_GroupCount(Map<String, Object> map);
	OrderVO orderDetail(Map<String, Object> map);
	List<OrderVO> get_OrderList(Map<String, Object> map);
    String haveRefunded(Map<String, Object> refundReturn);
	String onRefund(Map<String, Object> refundReturn);
}
