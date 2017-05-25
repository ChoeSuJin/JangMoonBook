package com.kosta.customer.model;

public class BookVO {
	private String title;
	private int price;
	private String author;
	private String publisher;
	private String type;
	private String isbn;
	private String category;

	public BookVO() {
		// TODO Auto-generated constructor stub
	}

	public BookVO(String title, int price, String author, String publisher, String type, String isbn, String category) {
		this.title = title;
		this.price = price;
		this.author = author;
		this.publisher =publisher;
		this.type = type;
		this.isbn = isbn;
		this.category = category;
	}
	/*Getter*/
	public String getTitle() {
		return title;
	}

	public int getPrice() {
		return price;
	}

	public String getAuthor() {
		return author;
	}

	public String getPublisher() {
		return publisher;
	}

	public String getType() {
		return type;
	}

	public String getIsbn() {
		return isbn;
	}

	public String getCategory() {
		return category;
	}
	
	/*Setter*/
	public void setTitle(String title) {
		this.title = title;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
}
