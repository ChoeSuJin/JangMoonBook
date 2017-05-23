package com.kosta.cart.model;

import java.util.List;


public interface CartDAO {

	public List<CartVO> listCart(String id);
	public void insert(CartVO vo);
	public void delete(String isbn);
	public void update(int cartno);
	public int sumMoney(String id);
	public int countCart(String id, String isbn);	//장바구니에 이미 상품이 담겼는지 확인
	public void updateCart(CartVO vo);		//장바구니 수량 변경
	public void modifyCart(CartVO vo);
	//public List<CartVO> cartMoney();

	
	

}



