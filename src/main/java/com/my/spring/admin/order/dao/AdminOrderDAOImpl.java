package com.my.spring.admin.order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.spring.order.dao.OrderDAO;
import com.my.spring.order.vo.OrderVO;

@Repository("adminOrderDAO")
public class AdminOrderDAOImpl implements AdminOrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private OrderVO orderVO;
	

	@Override
	public List<OrderVO> selectOrderList(Map<String, Object> pagingMap) {
		return sqlSession.selectList("mapper.admin.order.selectOrderList", pagingMap);
	}


	@Override
	public int selectTotalOrders() {
		return sqlSession.selectOne("mapper.admin.order.selectTotalOrders");
	}


	@Override
	public int selectAllOnDelivery() {
		String delivery_status="배송중";
		return sqlSession.selectOne("mapper.admin.order.selectAllOnDelivery",delivery_status);
	}


	@Override
	public int seletAllTotDoneDelivery() {
		String delivery_status="배송완료";
		return sqlSession.selectOne("mapper.admin.order.seletAllTotDoneDelivery",delivery_status);
	}




	@Override
	public void updateDelivery(String change_delivery_status, String change_detail_code) {
		Map<String,Object> changeMap=new HashMap();
		changeMap.put("change_delivery_status", change_delivery_status);
		changeMap.put("change_detail_code", change_detail_code);
		sqlSession.update("mapper.admin.order.updateDelivery",changeMap);		
	}


	@Override
	public int selectedTotal(Map pagingMap) {
		return sqlSession.selectOne("mapper.admin.order.selectedTotal",pagingMap);
	}


	@Override
	public int getTotalAvenue() {
		return sqlSession.selectOne("mapper.admin.order.getTotalAvenue");
	}


	@Override
	public int getTotalOrderCount() {
		return sqlSession.selectOne("mapper.admin.order.getTotalOrderCount");
	}


	@Override
	public void deleteOrder(Map<String, Object> requestMap) {
		sqlSession.delete("mapper.admin.order.deleteOrder",requestMap);
	}


	@Override
	public void setUpRefund(Map<String, Object> requestMap) {
		sqlSession.update("mapper.admin.order.setUpRefund",requestMap);
	}


	@Override
	public void insertRefund(Map<String, Object> requestMap) {
		sqlSession.insert("mapper.admin.order.insertRefund",requestMap);
	}


	@Override
	public int selectAllWaitingRefund() {
		String delivery_status="반품대기중";
		return sqlSession.selectOne("mapper.admin.order.selectAllWaitingRefund",delivery_status);
	}


	@Override
	public int selectAllDoneRefund() {
		String delivery_status="반품완료";
		return sqlSession.selectOne("mapper.admin.order.selectAllDoneRefund",delivery_status);
	}


	@Override
	public String atLeastOneOrder() {
		return sqlSession.selectOne("mapper.admin.order.atLeastOneOrder");
	}
}
