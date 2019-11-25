package com.my.spring.order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.spring.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertNewOrder(Map<String, Object> orderMap) {
		int sequence=seq_order_id_nextval();
		orderMap.put("seq_order_id",sequence);
		System.out.println("sequence :"+sequence);
		return sqlSession.insert("mapper.order.insertNewOrder", orderMap);
	}


	@Override
	public int selectAverageOrder(int member_code) {
		return sqlSession.selectOne("mapper.order.selectAverageOrder", member_code);
	}

	@Override
	public String haveOrdered(int member_code) {
		return sqlSession.selectOne("mapper.order.haveOrdered",member_code);
	}

	@Override
	public String onDelivery(int member_code) {
		Map<String,Object> returnMap=new HashMap<String, Object>();
		returnMap.put("member_code", member_code);
		returnMap.put("delivery_status", "배송중");
		return sqlSession.selectOne("mapper.order.onDelivery", returnMap);
	}

	@Override
	public List<OrderVO> selectOrderList(int member_code) {
		return sqlSession.selectList("mapper.order.selectOrderList",member_code);
	}
	@Override
	public int seq_order_id_nextval() {
		return sqlSession.selectOne("mapper.order.seq_order_id_nextval");
	}

	@Override
	public List<OrderVO> get_OrderList(Map<String, Object> map) {
		return sqlSession.selectList("mapper.order.get_OrderList",map);
	}
	
	@Override
	public List<Integer> order_Code_GroupCount(Map<String, Object> map) {
		return sqlSession.selectList("mapper.order.order_code_groupCount" , map);
	}
	
	@Override
	public OrderVO orderDetail(Map<String, Object> map) {
		return (OrderVO) sqlSession.selectOne("mapper.order.order_Detail", map);
	}

	@Override
	public String haveRefunded(Map<String, Object> refundReturn) {
		return sqlSession.selectOne("mapper.order.haveRefunded",refundReturn);
	}


	@Override
	public String onRefund(Map<String, Object> refundReturn) {
		return sqlSession.selectOne("mapper.order.onRefund",refundReturn);
	}
}
