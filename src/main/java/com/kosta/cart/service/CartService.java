package com.kosta.cart.service;

import java.util.List;

import com.kosta.cart.model.CartVO;

public interface CartService {
	public void insert(CartVO vo);
	public List<CartVO> listCart(String id);
	public void delete(String isbn);
	public void update(int cartno);
	public int sumMoney(String id);
	public int countCart(String id, String isbn);		//장바구니에 상품이 있는지 확인
	public void updateCart(CartVO vo); //장바구니 수량 변경
	public void modifyCart(CartVO vo);
	
	//public List<CartVO> cartMoney();
	}
	



	
	
	





