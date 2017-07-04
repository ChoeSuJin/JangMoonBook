package com.kosta.book.admin.mOnlineInventory.model;

public class InventoryVO {
	
	/*create table Inventory(
			  isbn varchar2(100),
			  title varchar2(20),
			  author varchar2(40),
			  quantity number,
			  branch varchar2(20)
			);*/
	
	private String isbn, title, branch, author;
	private int quantity;
	
	
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
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
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	

}
