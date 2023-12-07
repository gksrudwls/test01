package com.springstudy.jj.service;

import java.util.List;
import com.springstudy.jj.domain.Product;

public interface ProductService {
	
	public abstract void updateProduct(Product product);
	
	public abstract List<Product> myList(String id);
	
	public void deleteProduct(int no);
	
	public abstract Product getProduct(int no);
	
	// 글쓰기
	public abstract void insertProduct(Product product);
	
	/* 한 페이지에 보여 질 게시 글 리스트 요청 시 호출되는 메소드
	 * 현재 페이지에 해당하는 게시 글 리스트를 DB에서 읽어와 반환 하는 메소드
	 **/
	public abstract List<Product> productList();
	
}
