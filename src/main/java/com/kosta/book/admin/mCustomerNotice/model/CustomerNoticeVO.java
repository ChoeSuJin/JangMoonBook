package com.kosta.book.admin.mCustomerNotice.model;

import java.util.Date;

public class CustomerNoticeVO {
	
	private String title, contents;
	private Date regDate;
	private int ArticleNumber;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getArticleNumber() {
		return ArticleNumber;
	}
	public void setArticleNumber(int articleNumber) {
		ArticleNumber = articleNumber;
	}
	
	
	

}
