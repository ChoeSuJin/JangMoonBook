package com.kosta.customer.model;

public interface BookDAO {
	
	public BookVO bookSearchDao(String type, String title, String category);
	public void bookWrite(String title, int price, String author, String publisher, String type, String isbn, String category);
}
