	package com.springstudy.jj.dao;

import java.util.List;

import com.springstudy.jj.domain.Product;

public interface ProductDao {
	
	public abstract void updateProduct(Product product);
	
	// 마이 리스트
	public abstract List<Product> myList(String id);
	
	// 삭제하기
	public void deleteProduct(int no);
	
	// 게시물 불러오기(상세보기)
	public abstract Product getProduct(int no);
	
	/* 한 페이지에 보여 질 게시 글 리스트 요청 시 호출되는 메소드
	 * 현재 페이지에 해당하는 게시 글 리스트를 DB에서 읽어와 반환 하는 메소드
	 **/
	public abstract List<Product> productList();
	
	// 글쓰기
	public abstract void insertProduct(Product product);
	
}
