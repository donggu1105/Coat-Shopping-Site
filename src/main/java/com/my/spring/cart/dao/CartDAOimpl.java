package com.my.spring.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.spring.cart.vo.CartVO;
import com.my.spring.product.vo.ProductDetailVO;

@Repository("cartDAO")
public class CartDAOimpl implements CartDAO{
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void addcart(CartVO vo) {
		sqlsession.insert("mapper.cart.addcart",vo);
	}

	@Override
	public List<CartVO> CartList(Map<String, Object> map) {
		return sqlsession.selectList("mapper.cart.cartlist",map);
	}

	@Override
	public String Cart_Overlap(Map<String, Object> map) {
		return sqlsession.selectOne("mapper.cart.cart_overlap" , map);
	}

	@Override
	public void UpdateCart(Map<String, Object> map) {
		sqlsession.update("mapper.cart.updatecart",map);
	}

	@Override
	public int TotalPrice(Map<String, Object> map) {
		return sqlsession.selectOne("mapper.cart.totalprice", map);
	}

	@Override
	public void AddOverlapCart(CartVO vo) {
		sqlsession.update("mapper.cart.AddOverlapCart",vo);
	}

	@Override
	public int DeleteCart(Map<String, Object> map) {
		return sqlsession.delete("mapper.cart.DeleteCart" , map);
	}

	@Override
	public List<ProductDetailVO> getOptions(int pro_code) {
		return sqlsession.selectList("mapper.product.getOptions", pro_code);
	}

	@Override
	public String get_Pro_Detail_Code(Map<String, Object> map) {
		return sqlsession.selectOne("mapper.product.get_Pro_Detail_Code" , map);
	}

	@Override
	public int ChangeTarget_QuantityCheck(Map<String, Object> map) {
		return sqlsession.selectOne("mapper.cart.ChangeTarget_QuantityCheck" , map);
	}

	@Override
	public void allUpdateCart(Map<String, Object> map) {
		sqlsession.update("mapper.cart.allupdateCart" , map);
	}
	@Override
	public String flagInCart(int member_code) {
		return sqlsession.selectOne("mapper.cart.flagInCart", member_code);
	}

	@Override
	public String onCart(int member_code) {
		return sqlsession.selectOne("mapper.cart.onCart",member_code);
	}

	@Override
	public List<CartVO> cartListByMember_code(int member_code) {
		return sqlsession.selectList("mapper.cart.cartListByMember_code",member_code);
	}
	


}
