package com.springstudy.jj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.springstudy.jj.dao.ProductDao;
import com.springstudy.jj.domain.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public void deleteProduct(int no) {
		productDao.deleteProduct(no);
	}
	
	@Override
	public Product getProduct(int no) {
		return productDao.getProduct(no);
	}
	
	@Override
	public void insertProduct(Product product) {
		productDao.insertProduct(product);
	}

	@Override
	public List<Product> productList() {
		
		return productDao.productList();
	}

	@Override
	public List<Product> myList(String id) {
		
		return productDao.myList(id);
	}

	@Override
	public void updateProduct(Product product) {
		productDao.updateProduct(product);
	}

}
