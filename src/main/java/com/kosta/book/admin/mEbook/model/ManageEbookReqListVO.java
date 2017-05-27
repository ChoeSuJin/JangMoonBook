package com.kosta.book.admin.mEbook.model;

public class ManageEbookReqListVO {
	
	/* ebook_reqNo number,
	  isbn varchar2(50),
	  title varchar2(50),
	  com varchar2(50)*/
	
	private String isbn, title, ono;
	private int reqNo;
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public int getReqNo() {
		return reqNo;
	}
	public void setReqNo(int reqNo) {
		this.reqNo = reqNo;
	}
	
	
	

}
