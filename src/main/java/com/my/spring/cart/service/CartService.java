package com.my.spring.cart.service;

import java.util.List;
import java.util.Map;

import com.my.spring.cart.vo.CartVO;
import com.my.spring.product.vo.ProductDetailVO;

public interface CartService {
	void addcart(CartVO vo);
	List<CartVO> CartList(Map<String, Object> map);
	String Cart_Overlap(Map<String , Object> map);
	int DeleteCart(Map<String, Object> map);
	void UpdateCart(Map<String , Object> map);
	int TotalPrice(Map<String, Object> map);
	void AddOverlapCart(CartVO vo);
	List<ProductDetailVO> getOptions(int pro_code);
	String get_Pro_Detail_Code(Map<String, Object> map);
	CartVO SetCartService(Map<String , Object> map);
	int ChangeTarget_QuantityCheck(Map<String , Object> map);
	void allUpdateCart(Map<String ,Object> map);
}
