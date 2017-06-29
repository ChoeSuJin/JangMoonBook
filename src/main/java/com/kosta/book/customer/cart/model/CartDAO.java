package com.kosta.book.customer.cart.model;

import java.util.List;


public interface CartDAO {

	public List<CartVO> listCart(String id);
	public void insert(CartVO vo);
	public void delete(String isbn);
	public void update(int cartno);
	public int sumMoney(String id);
	public int countCart(String id, String isbn);	//�옣諛붽?���땲�뿉 �씠誘� �긽��?��?�� �떞寃쇰?��吏� �솗�씤
	public void updateCart(CartVO vo);		//�옣諛붽?���땲 �닔�웾 蹂�寃�
	public void modifyCart(CartVO vo);
}



