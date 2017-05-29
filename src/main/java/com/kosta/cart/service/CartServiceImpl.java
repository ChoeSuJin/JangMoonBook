package com.kosta.cart.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.cart.model.CartDAO;
import com.kosta.cart.model.CartVO;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	CartDAO cartDAO;
	
	
	@Override
	public void insert(CartVO vo) {
		cartDAO.insert(vo);
	}

	@Override
	public List<CartVO> listCart(String id) {
		
		return cartDAO.listCart(id);
	}

	@Override
	public void delete(String isbn) {
		 cartDAO.delete(isbn);
	}

	@Override
	public void update(int cartno) {
	
	}

	@Override
	public int sumMoney(String id) {
		
		return cartDAO.sumMoney(id);
	}

	@Override
	public int countCart(String id, String isbn) {
	
		return cartDAO.countCart(id, isbn);
	}

	@Override
	public void updateCart(CartVO vo) {
	
		cartDAO.updateCart(vo);
	}
	@Override
	public void modifyCart(CartVO vo) {
		cartDAO.modifyCart(vo); 
	}
	/*
	 

	@Override
	public List<CartVO> cartMoney() {
		return cartDao.cartMoney(); 
	}
	
	*/



}







