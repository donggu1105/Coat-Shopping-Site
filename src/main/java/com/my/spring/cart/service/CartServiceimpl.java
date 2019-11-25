package com.my.spring.cart.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.cart.dao.CartDAO;
import com.my.spring.cart.vo.CartVO;
import com.my.spring.product.vo.ProductDetailVO;

@Service("cartService")
public class CartServiceimpl implements CartService{

	@Autowired
	private CartDAO cartdao;
	
	@Override
	public void addcart(CartVO vo) {
		cartdao.addcart(vo);
	}

	@Override
	public List<CartVO> CartList(Map<String, Object> map) {
		return cartdao.CartList(map);
	}

	@Override
	public String Cart_Overlap(Map<String, Object> map) {
		return cartdao.Cart_Overlap(map);
	}

	@Override
	public int DeleteCart(Map<String, Object> map) {
		return cartdao.DeleteCart(map);
	}

	@Override
	public void UpdateCart(Map<String, Object> map) {
		cartdao.UpdateCart(map);
	}

	@Override
	public int TotalPrice(Map<String, Object> map) {
		return cartdao.TotalPrice(map);
	}

	@Override
	public void AddOverlapCart(CartVO vo) {
		cartdao.AddOverlapCart(vo);
	}

	@Override
	public List<ProductDetailVO> getOptions(int pro_code) {
		return cartdao.getOptions(pro_code);
	}

	@Override
	public String get_Pro_Detail_Code(Map<String, Object> map) {
		return cartdao.get_Pro_Detail_Code(map);
	}

	@Override
	public CartVO SetCartService(Map<String, Object> map) {
		CartVO vo = new CartVO();
		vo.setCart_pro_code((Integer)map.get("pro_code"));
		vo.setCart_pro_detail_code((Integer)map.get("pro_detail_code"));
		if(map.get("col").equals("member"))
			vo.setCart_member_code((Integer)map.get("code"));
		else if(map.get("col").equals("nonmember"))
			vo.setCart_nonmember_code((Integer)map.get("code"));
		vo.setCart_pro_quantity((Integer)map.get("quantity"));
		vo.setCart_pro_color((String)map.get("color"));
		vo.setCart_pro_size((String)map.get("size"));
		vo.setCart_pro_price((Integer)map.get("price"));
		return vo;
	}

	@Override
	public int ChangeTarget_QuantityCheck(Map<String, Object> map) {
		return cartdao.ChangeTarget_QuantityCheck(map);
	}

	@Override
	public void allUpdateCart(Map<String, Object> map) {
		cartdao.allUpdateCart(map);
	}





}
