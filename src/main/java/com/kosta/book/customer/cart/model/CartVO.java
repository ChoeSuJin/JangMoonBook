package com.kosta.book.customer.cart.model;

public class CartVO {
	private int cartno;  //�옣諛붽?���땲踰덊?��
	private String id; //�쉶�썝�븘�씠�뵒
	private String isbn;
	private String title;
	private String image;
	private String status;
	private int price;	//媛�寃�
	private int amount; //�닔�웾
	private int money;	//��??��
	
	public int getCartno() {
		return cartno;
	}
	public void setCartno(int cartno) {
		this.cartno = cartno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	@Override
	public String toString() {
		return "CartVO [cartno=" + cartno + ", id=" + id + ", isbn=" + isbn + ", title=" + title + ", image=" + image
				+ ", price=" + price + ", amount=" + amount + ", money=" + money + "]";
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
	
}
