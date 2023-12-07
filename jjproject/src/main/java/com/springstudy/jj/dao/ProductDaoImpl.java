package com.springstudy.jj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springstudy.jj.domain.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.springstudy.jj.mapper.ProductMapper";
	
	@Override
	public void deleteProduct(int no) {
	sqlSession.delete(NAME_SPACE + ".deleteProduct", no);
	}
	
	@Override
	public Product getProduct(int no) {
		// SELECT * FROM springbbs WHERE no = ?
		return sqlSession.selectOne(NAME_SPACE + ".productDetail", no);
	}
	
	@Override
	public List<Product> productList() {
		
		return sqlSession.selectList(NAME_SPACE + ".productList");
	}

	@Override
	public void insertProduct(Product product) {
		sqlSession.insert(NAME_SPACE + ".insertProduct", product);
	}

	@Override
	public List<Product> myList(String id) {
		
		return sqlSession.selectList(NAME_SPACE + ".myList", id);
	}

	@Override
	public void updateProduct(Product product) {
		sqlSession.update(NAME_SPACE + ".updateProduct", product);
	}
	
}
