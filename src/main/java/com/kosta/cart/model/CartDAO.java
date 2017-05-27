package com.kosta.cart.model;

import java.util.List;


public interface CartDAO {

	public List<CartVO> listCart(String id);
	public void insert(CartVO vo);
	public void delete(String isbn);
	public void update(int cartno);
	public int sumMoney(String id);
	public int countCart(String id, String isbn);	//�옣諛붽뎄�땲�뿉 �씠誘� �긽�뭹�씠 �떞寃쇰뒗吏� �솗�씤
	public void updateCart(CartVO vo);		//�옣諛붽뎄�땲 �닔�웾 蹂�寃�
	public void modifyCart(CartVO vo);
}



