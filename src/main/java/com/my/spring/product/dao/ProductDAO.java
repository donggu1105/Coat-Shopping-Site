package com.my.spring.product.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.my.spring.product.vo.ImageFileVO;
import com.my.spring.product.vo.ProductVO;

public interface ProductDAO {
	List<ProductVO> productlist(Map<String, Object> map);
	int productlist_count(Map<String, Object> map);
	Map<String, Object> productdetail(int pro_code);
	void productcountupdate(int pro_code);
	String productquantity_check(Map<String, Object> map);
	List<String> selectOrder_pro_name_list(List<Integer> order_pro_code_list);
	int product_detail_code(Map<String, Object> map);
	
	//리뷰관련
	List<ProductVO> selectAllProducts(Map buylistMap);
}
