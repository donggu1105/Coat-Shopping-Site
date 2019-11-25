package com.my.spring.admin.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.admin.product.dao.AdminProductDAO;
import com.my.spring.product.vo.ImageFileVO;
import com.my.spring.product.vo.ProductDetailVO;
import com.my.spring.product.vo.ProductVO;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService {
	@Autowired
	AdminProductDAO adminProductDAO;
	@Override
	public int addNewProduct(Map newProductMap) {
		//��ǰ �ֱ�
		int pro_code=adminProductDAO.insertNewProduct(newProductMap);
		//�̹��� �ֱ�
		ArrayList<ImageFileVO> imageFileList=(ArrayList)newProductMap.get("imageFileList");
		for(ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setPro_code(pro_code); //�� �̹������ϴ� ��ǰ��ȣ ���
		}
		adminProductDAO.insertProductImageFile(imageFileList); //�̹������� �ֱ�
		
		newProductMap.put("pro_code", pro_code);
		adminProductDAO.insertNewProductDetail(newProductMap);//Product_Detail Insert
		
		return pro_code;
	}
	@Override
	public Map listProducts(Map pagingMap) {
		
		Map<String,Object> productsMap=new HashMap();
		
		List<ProductVO> productsList=adminProductDAO.selectAllProducts(pagingMap); //��ǰ��� ��������
		int totProducts=adminProductDAO.selectTotalProducts();//��ü����
		 int selectedProducts=adminProductDAO.selectedTotalProducts(pagingMap); 
		 System.out.println(" selectedProducts:"+selectedProducts);
		int newProducts=adminProductDAO.selectNewProducts();//����ǰ����
		int bestProducts=adminProductDAO.selectBestProducts();//����Ʈ��������
		int steadyProducts=adminProductDAO.selectSteadyProducts();//���׵𼿷�����
		int offProducts=adminProductDAO.selectOffProducts();//�����߰���
		int outProducts=adminProductDAO.selectOutProducts();//ǰ������
		int orderedTotal=adminProductDAO.selectOrderedTotal(pagingMap);
		
		productsMap.put("productsList", productsList);
		productsMap.put("totProducts", totProducts);
		productsMap.put("bestProducts", bestProducts);
		productsMap.put("newProducts", newProducts);
		productsMap.put("steadyProducts", steadyProducts);
		productsMap.put("offProducts", offProducts);
		productsMap.put("outProducts", outProducts);
		productsMap.put("orderedTotal", orderedTotal);
		 productsMap.put("selectedProducts", selectedProducts); 
		
		List<ProductDetailVO> modelList=adminProductDAO.selectAllProductsDetail();
		
		productsMap.put("modelList", modelList);
		
		return productsMap;
	}
	@Override
	public void addNewModel(Map productDetailMap) {
			adminProductDAO.insertNewProductDetail(productDetailMap);
	}
	@Override
	public void deleteProducts(Map deleteMap) {
			adminProductDAO.deleteProducts(deleteMap);
	}
	@Override
	public Map<String, Object> getProductStatics() {
		Map<String,Object> returnMap=new HashMap();
		int totalCoat=0;
		
		int newProducts=adminProductDAO.selectNewProducts();//����ǰ����
		int bestProducts=adminProductDAO.selectBestProducts();//����Ʈ��������
		int steadyProducts=adminProductDAO.selectSteadyProducts();//���׵𼿷�����
		int offProducts=adminProductDAO.selectOffProducts();//�����߰���
		int outProducts=adminProductDAO.selectOutProducts();//ǰ������
		
		totalCoat=adminProductDAO.selectAllCoat();
		
		returnMap.put("bestProducts", bestProducts);
		returnMap.put("newProducts", newProducts);
		returnMap.put("steadyProducts", steadyProducts);
		returnMap.put("offProducts", offProducts);
		returnMap.put("outProducts", outProducts);
		returnMap.put("totalCoat", totalCoat);
		
		return returnMap;
	}

}
