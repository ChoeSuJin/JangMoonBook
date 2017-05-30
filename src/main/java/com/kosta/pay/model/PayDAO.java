package com.kosta.pay.model;

import com.kosta.cart.model.CartVO;

public interface PayDAO {
	
	public void insertSaleList(CartVO vo);
	public void insertGetDelivery(GetDeliveryVO vo);
	public void minusInventory(CartVO vo);
	public void updateDelivery(CartVO vo);

}
