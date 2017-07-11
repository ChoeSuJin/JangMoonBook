package com.kosta.book.customer.cart.service;

import java.util.List;

import com.kosta.book.customer.cart.model.CartVO;

public interface CartService {
	public void insert(CartVO vo);
	public List<CartVO> listCart(String id);
	public void delete(String isbn);
	public void update(int cartno);
	public int sumMoney(String id);
	public int countCart(String id, String isbn);		//�옣諛붽?���땲�뿉 �긽��?��?�� �엳�뒗吏� �솗�씤
	public void updateCart(CartVO vo); //�옣諛붽?���땲 �닔�웾 蹂�寃�
	public void modifyCart(CartVO vo);
	
	//public List<CartVO> cartMoney();
	}
	



	
	
	





