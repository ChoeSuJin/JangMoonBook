package com.kosta.cart.service;

import java.util.List;

import com.kosta.book.admin.mInventory.model.BookInfoVO;
import com.kosta.cart.model.CartVO;

public interface CartService {
	public void insert(CartVO vo);
	public List<CartVO> listCart(String id);
	public void delete(BookInfoVO vo);
	public void update(int cartno);
	public int sumMoney(String id);
	public CartVO countCart(String id, String isbn);
	public void updateCart(CartVO vo);
	public void modifyCart(CartVO vo);
	
	}
	



	
	
	





