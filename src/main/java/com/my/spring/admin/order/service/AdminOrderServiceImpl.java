package com.my.spring.admin.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.admin.order.dao.AdminOrderDAO;
import com.my.spring.order.dao.OrderDAO;
import com.my.spring.order.vo.OrderVO;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {

	@Autowired
	AdminOrderDAO adminOrderDAO;

	@Override
	public Map<String, Object> getOrderList(Map<String, Object> pagingMap) {
	Map<String,Object> viewMap=new HashMap();
	
		int totOrders,totOnDelivery,totDoneDelivery,selectedTotal,totWaitingRefundDelivery,totDoneRefundDelivery=0;
		
		//orderList 가져오기
		List<OrderVO> orderList=adminOrderDAO.selectOrderList(pagingMap); 
		totOrders=adminOrderDAO.selectTotalOrders();
		totOnDelivery=adminOrderDAO.selectAllOnDelivery();
		totDoneDelivery=adminOrderDAO.seletAllTotDoneDelivery();
		totWaitingRefundDelivery=adminOrderDAO.selectAllWaitingRefund();
		totDoneRefundDelivery=adminOrderDAO.selectAllDoneRefund();
		selectedTotal=adminOrderDAO.selectedTotal(pagingMap);
		
		viewMap.put("orderList", orderList);
		viewMap.put("totOrders", totOrders);
		viewMap.put("totOnDelivery", totOnDelivery);
		viewMap.put("totDoneDelivery", totDoneDelivery);
		viewMap.put("totWaitingRefundDelivery", totWaitingRefundDelivery);
		viewMap.put("totDoneRefundDelivery", totDoneRefundDelivery);
		return viewMap;
	}

	@Override
	public void changeDelivery(String change_delivery_status, String change_detail_code) {
		adminOrderDAO.updateDelivery(change_delivery_status,change_detail_code);		
	}

	@Override
	public Map<String, Object> getOrderStatics() {
		
		Map<String,Object> viewMap=new HashMap();
		int totalAvenue = 0;
		int totalOrderCount=0;
		int totOrders=0;
		int totDoneRefundDelivery=0;
		
		String orderFlag=adminOrderDAO.atLeastOneOrder();
		
		if(orderFlag.equals("true")) {
		totalAvenue=adminOrderDAO.getTotalAvenue();
		totalOrderCount=adminOrderDAO.getTotalOrderCount();
		totOrders=adminOrderDAO.selectTotalOrders();
		totDoneRefundDelivery=adminOrderDAO.selectAllDoneRefund();
		}
		
		viewMap.put("totalAvenue", totalAvenue);
		viewMap.put("totalOrderCount", totalOrderCount);
		viewMap.put("totOrders", totOrders);
		viewMap.put("totDoneRefundDelivery", totDoneRefundDelivery);
		
		return viewMap;
	}

	@Override
	public void addRefund(Map<String, Object> requestMap) {
		
		//배송완료에서 반품대기중으로 바꾸기
		String waitingRefund="반품대기중";
		requestMap.put("waitingRefund", waitingRefund);
		adminOrderDAO.setUpRefund(requestMap);
		//반품대기중인 상품 refund테이블에 넣기
		adminOrderDAO.insertRefund(requestMap);
		System.out.println("insert Refund");
		//반품리스트뽑고 그래프 만들고 오더목록에서 지우기까지 
		//반품확정나면 오더목록에서 지우기
		/* adminOrderDAO.deleteOrder(requestMap); */
	
	}
}
