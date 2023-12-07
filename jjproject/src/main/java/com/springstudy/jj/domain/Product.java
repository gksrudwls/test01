package com.springstudy.jj.domain;

import java.sql.Timestamp;

public class Product {
	
	private int no;
	private String title;
	private String content;
	private int price;
	private String file1;
	private Timestamp regDate;
	private String memberId;
	private Timestamp writeTime;
	
	public Product() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Timestamp getWriteTime() {
		return writeTime;
	}
	
	public void setWriteTime(Timestamp writeTime) {
		this.writeTime = writeTime;
	}
	
}
