package com.my.spring.admin.product.service;

import java.util.List;
import java.util.Map;

public interface AdminProductService {

	int addNewProduct(Map newProductMap);

	Map listProducts(Map pagingMap);

	void addNewModel(Map productDetailMap);

	void deleteProducts(Map deleteMap);

	Map<String, Object> getProductStatics();

}
