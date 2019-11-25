package com.my.spring.admin.order.service;

import java.util.Map;

public interface AdminOrderService {

	Map<String, Object> getOrderList(Map<String, Object> pagingMap);

	void changeDelivery(String change_delivery_status, String change_detail_code);

	Map<String, Object> getOrderStatics();

	void addRefund(Map<String, Object> requestMap);

}
