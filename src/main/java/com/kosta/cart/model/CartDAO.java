package com.kosta.cart.model;

import java.util.List;

import com.kosta.book.admin.mInventory.model.BookInfoVO;


public interface CartDAO {

	public List<CartVO> listCart(String id);
	public List<CartVO> listCartEbook(String id);
	public void insert(CartVO vo);
	public void delete(BookInfoVO vo);
	public void update(int cartno);
	public int sumMoney(String id);
	public int sumMoneyEbook(String id);
	public int countCart(String id, String isbn);	
	public void updateCart(CartVO vo);	
	public void modifyCart(CartVO vo);
	public int checkInsertEbook(CartVO vo);
	public int checkInsertEbookSalelist(CartVO vo);
}



