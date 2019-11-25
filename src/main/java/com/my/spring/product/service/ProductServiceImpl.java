package com.my.spring.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.product.dao.ProductDAO;
import com.my.spring.product.vo.ImageFileVO;
import com.my.spring.product.vo.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDAO productDAO;

	@Override
	public List<ProductVO> productlist(Map<String, Object> map) {
		return productDAO.productlist(map);
	}

	@Override
	public int productlist_count(Map<String , Object> map) {
		return productDAO.productlist_count(map);
	}

	@Override
	public Map<String, Object> productdetail(int pro_code) {
		return productDAO.productdetail(pro_code);
	}

	@Override
	public void productcountupdate(int pro_code) {
		productDAO.productcountupdate(pro_code);
	}

	@Override
	public String productquantity_check(Map<String, Object> map) {
		return productDAO.productquantity_check(map);
	}

	@Override
	public int product_detail_code(Map<String, Object> map) {
		return productDAO.product_detail_code(map);
	}

}
