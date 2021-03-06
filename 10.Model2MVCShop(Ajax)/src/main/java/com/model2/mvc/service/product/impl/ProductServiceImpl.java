package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserDao;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;


//==> 상품관리 서비스 구현
@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {

	///Field
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	//contructor
	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}
	
	
	//method
	@Override
	public void addProduct(Product product) throws Exception {
		productDao.addProduct(product);		
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return productDao.getProduct(prodNo);
	}
	public Product getProduct2(int tranNo) throws Exception {
		// TODO Auto-generated method stub
		return productDao.getProduct2(tranNo);
	}

	@Override
	public Map<String, Object> getProductList(Search search) throws Exception {
				
		List<Product> list= productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	public Map<String, Object> getProductList2(Search search) throws Exception {
		
		List<Product> list= productDao.getProductList2(search);
		int totalCount = productDao.getTotalCount2(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		productDao.updateProduct(product);
	}
	public void updateProdQuantity(Product product) throws Exception {
		productDao.updateProdQuantity(product);
	}
}
