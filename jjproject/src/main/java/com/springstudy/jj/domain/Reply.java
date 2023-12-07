package com.springstudy.jj.domain;

import java.sql.Timestamp;

public class Reply {
	private int replyNo;
	private String replyContent;
	private int replyPrice;
	private String replyWriter;
	private Timestamp regDate;
	private int productNo;
	
	public Reply() {}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getReplyPrice() {
		return replyPrice;
	}

	public void setReplyPrice(int replyPrice) {
		this.replyPrice = replyPrice;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
		
	
}
