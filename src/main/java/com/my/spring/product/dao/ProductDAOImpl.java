package com.my.spring.product.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.spring.product.vo.ImageFileVO;
import com.my.spring.product.vo.ProductDetailVO;
import com.my.spring.product.vo.ProductVO;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProductVO> productlist(Map<String, Object> map) {
		return sqlSession.selectList("mapper.product.productlist", map);
	}

	@Override
	public int productlist_count(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.product.productlist_count", map);
	}

	@Override
	public Map<String, Object> productdetail(int pro_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", sqlSession.selectOne("mapper.product.product", pro_code));
		List<ProductDetailVO> list = new ArrayList<ProductDetailVO>();
		list = sqlSession.selectList("mapper.product.productdetail", pro_code);
		map.put("product_detail", list);
		List<ImageFileVO> imagelist = new ArrayList<ImageFileVO>();
		imagelist = sqlSession.selectList("mapper.product.productimage", pro_code);
		map.put("product_image", imagelist);
		return map;
	}

	@Override
	public void productcountupdate(int pro_code) {
		sqlSession.update("mapper.product.productcount", pro_code);
	}

	@Override
	public String productquantity_check(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.product.quantity_check", map);
	}

	@Override
	public List<String> selectOrder_pro_name_list(List<Integer> order_pro_code_list) {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("order_pro_code_list", order_pro_code_list);
		return sqlSession.selectList("mapper.product.selectOrder_pro_name_list", parameterMap);
	}

	@Override
	public int product_detail_code(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.product.productDetail_code", map);
	}

	// review관련
	@Override
	public List<ProductVO> selectAllProducts(Map buylistMap) {
		return sqlSession.selectList("mapper.product.selectAllProducts");
	}

}
