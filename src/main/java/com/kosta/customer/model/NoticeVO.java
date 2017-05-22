package com.kosta.customer.model;

public class NoticeVO {

	private String title;
	private String regDate;
	private String content;
	private int articleNumber;

	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeVO(String title, String regDate, String content, int articleNumber) {
		this.title = title;
		this.regDate = regDate;
		this.content = content;
		this.articleNumber = articleNumber;
	}

	public int getArticleNumber() {
		return articleNumber;
	}

	public void setArticleNumber(int articleNumber) {
		this.articleNumber = articleNumber;
	}

	public String gettitle() {
		return title;
	}

	public void settitle(String title) {
		this.title = title;
	}

	public String getregDate() {
		return regDate;
	}

	public void setregDate(String regDate) {
		this.regDate = regDate;
	}

	public String getcontent() {
		return content;
	}

	public void setcontent(String content) {
		this.content = content;
	}
}
