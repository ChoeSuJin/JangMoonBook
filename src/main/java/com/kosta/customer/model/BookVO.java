package com.kosta.customer.model;

public class BookVO {
	private String title;
	private int price;
	private String author;
	private String publisher;
	private String type;
	private String isbn;
	private String category;
	private int sql;
	private String id;
	private String book;

	public BookVO() {
		// TODO Auto-generated constructor stub
	}

	public BookVO(String title, int price, String author, String publisher, String type, String isbn, String category, int sql, String id, String book) {
		this.title = title;
		this.price = price;
		this.author = author;
		this.publisher =publisher;
		this.type = type;
		this.isbn = isbn;
		this.category = category;
		this.sql = sql;
		this.id = id;
		this.book = book;
	}
	/*Getter*/
	
	
	public String getTitle() {
		return title;
	}

	public String getBook() {
		return book;
	}

	public String getId() {
		return id;
	}

	public int getSql() {
		return sql;
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

	public void setBook(String book) {
		this.book = book;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setSql(int sql) {
		this.sql = sql;
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
