package com.my.spring.admin.product.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.spring.product.vo.ImageFileVO;
import com.my.spring.product.vo.ProductDetailVO;
import com.my.spring.product.vo.ProductVO;

@Repository("adminProductDAO")
public class AdminProductDAOImpl implements AdminProductDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertNewProduct(Map newProductMap) {
		sqlSession.insert("mapper.admin.product.insertNewProduct",newProductMap);
		return Integer.parseInt((String)newProductMap.get("pro_code"));
	}

	@Override
	public void insertProductImageFile(ArrayList<ImageFileVO> imageFileList) {
		
//		for(ImageFileVO imageFileVO : imageFileList) {
//			sqlSession.insert("mapper.admin.product.insertProductImageFile",imageFileVO);
//		}
		for(int i=0; i<imageFileList.size(); i++) {
			ImageFileVO imageFileVO=(ImageFileVO)imageFileList.get(i);
			sqlSession.insert("mapper.admin.product.insertProductImageFile",imageFileVO);
		}
	}

	@Override
	public List<ProductVO> selectAllProducts(Map pagingMap) {
		return sqlSession.selectList("mapper.admin.product.selectAllProducts",pagingMap);
	}

	@Override
	public int selectTotalProducts() {
		return sqlSession.selectOne("mapper.admin.product.selectTotalProducts");
	}

	@Override
	public int selectNewProducts() {
		return sqlSession.selectOne("mapper.admin.product.selectNewProducts");
	}

	@Override
	public int selectBestProducts() {
		return sqlSession.selectOne("mapper.admin.product.selectBestProducts");
	}

	@Override
	public int selectOffProducts() {
		return sqlSession.selectOne("mapper.admin.product.selectOffProducts");
	}

	@Override
	public int selectSteadyProducts() {
		return sqlSession.selectOne("mapper.admin.product.selectSteadyProducts");
	}

	@Override
	public int selectOutProducts() {
		return sqlSession.selectOne("mapper.admin.product.selectOutProducts");
	}

	@Override
	public void insertNewProductDetail(Map productDetailMap) {
		sqlSession.insert("mapper.admin.product.insertNewProductDetail", productDetailMap);
	}

	@Override
	public List<ProductDetailVO> selectAllProductsDetail() {
		return sqlSession.selectList("mapper.admin.product.selectAllProductsDetail");
	}

	@Override
	public void deleteProducts(Map deleteMap) {
		 sqlSession.delete("mapper.admin.product.deleteProducts", deleteMap);
	}

	@Override
	public int selectOrderedTotal(Map pagingMap) {
		return sqlSession.selectOne("mapper.admin.product.selectOrderedTotal", pagingMap);
	}

	@Override
	public int selectAllCoat() {
		String pro_category="코트";
		return sqlSession.selectOne("mapper.admin.product.selectAllCoat",pro_category);
	}

	@Override
	public int selectedTotalProducts(Map pagingMap) {
		return sqlSession.selectOne("mapper.admin.product.selectedTotalProducts",pagingMap);
	}


}
