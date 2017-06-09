package com.kosta.book.admin.mOnlineInventory.model;

public class OrderListVO {
//	create table orderList(
//			  orderNumber number,
//			  isbn varchar2(100),
//			  title varchar2(50),
//			  publisher varchar2(50),
//			  quantity number,
//			  branch varchar2(20),
//			  cost number,
//			  o_date varchar2(10)
//			);
	
	private String title, publisher, branch, o_date, isbn;
	private int quantity, cost, orderNumber;
	
	
	
	
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
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
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	
	

}
