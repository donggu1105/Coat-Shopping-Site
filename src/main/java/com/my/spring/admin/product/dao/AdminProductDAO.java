package com.my.spring.admin.product.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.my.spring.product.vo.ImageFileVO;
import com.my.spring.product.vo.ProductDetailVO;
import com.my.spring.product.vo.ProductVO;

public interface AdminProductDAO {

	int insertNewProduct(Map newProductMap);

	void insertProductImageFile(ArrayList<ImageFileVO> imageFileList);

	List<ProductVO> selectAllProducts(Map pagingMap);

	int selectTotalProducts();

	int selectNewProducts();

	int selectBestProducts();

	int selectOffProducts();

	int selectSteadyProducts();

	int selectOutProducts();

	void insertNewProductDetail(Map productDetailMap);

	List<ProductDetailVO> selectAllProductsDetail();

	void deleteProducts(Map deleteMap);

	int selectOrderedTotal(Map pagingMap);

	int selectAllCoat();

	int selectedTotalProducts(Map pagingMap);



}
