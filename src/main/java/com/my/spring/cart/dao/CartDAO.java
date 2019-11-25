package com.my.spring.cart.dao;

import java.util.List;
import java.util.Map;

import com.my.spring.cart.vo.CartVO;
import com.my.spring.product.vo.ProductDetailVO;

public interface CartDAO {
	void addcart(CartVO vo);
	List<CartVO> CartList(Map<String, Object> map);
	String Cart_Overlap(Map<String , Object> map);
	int DeleteCart(Map<String, Object> map);
	void UpdateCart(Map<String , Object> map);
	int TotalPrice(Map<String, Object> map);
	void AddOverlapCart(CartVO vo);
	List<ProductDetailVO> getOptions(int pro_code);
	String get_Pro_Detail_Code(Map<String, Object> map);
	int ChangeTarget_QuantityCheck(Map<String , Object> map);
	void allUpdateCart(Map<String ,Object> map);
	String flagInCart(int member_code);
	String onCart(int member_code);
	List<CartVO> cartListByMember_code(int member_code);
}
