package com.kosta.cart.service;

import java.util.List;

import com.kosta.cart.model.CartVO;

public interface CartService {
	public void insert(CartVO vo);
	public List<CartVO> listCart(String id);
	public void delete(String isbn);
	public void update(int cartno);
	public int sumMoney(String id);
	public int countCart(String id, String isbn);
	public void updateCart(CartVO vo);
	public void modifyCart(CartVO vo);
	
	}
	



	
	
	





