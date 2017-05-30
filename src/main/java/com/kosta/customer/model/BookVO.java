package com.kosta.customer.model;

public class BookVO {
	private int book;
	private String title;
	private int price;
	private String author;
	private String publisher;
	private String type;
	private String isbn;
	private String category;
	private String id;
	private String image;
	
	public BookVO() {
		// TODO Auto-generated constructor stub
	}

	public BookVO(String title, int price, String author, String publisher, String type, String isbn, String category, int book, String id,String image) {
		this.title = title;
		this.price = price;
		this.author = author;
		this.publisher =publisher;
		this.type = type;
		this.isbn = isbn;
		this.category = category;
		this.book = book;
		this.id = id;
		this.image = image;
	}
	/*Getter*/

	public int getBook() {
		return book;
	}

	public void setBook(int book) {
		this.book = book;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
}
	