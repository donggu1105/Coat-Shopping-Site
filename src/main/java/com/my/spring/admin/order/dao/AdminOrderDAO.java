package com.my.spring.admin.order.dao;

import java.util.List;
import java.util.Map;

import com.my.spring.order.dao.OrderDAO;
import com.my.spring.order.vo.OrderVO;

public interface AdminOrderDAO {

	List<OrderVO> selectOrderList(Map<String, Object> pagingMap);

	int selectTotalOrders();

	int selectAllOnDelivery();

	int seletAllTotDoneDelivery();

	void updateDelivery(String change_delivery_status, String change_detail_code);

	int selectedTotal(Map<String, Object> pagingMap);

	int getTotalAvenue();

	int getTotalOrderCount();

	void deleteOrder(Map<String, Object> requestMap);

	void setUpRefund(Map<String, Object> requestMap);

	void insertRefund(Map<String, Object> requestMap);

	int selectAllWaitingRefund();

	int selectAllDoneRefund();

	String atLeastOneOrder();

}
