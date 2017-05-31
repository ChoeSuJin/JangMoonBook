package com.kosta.pay.model;

import java.util.List;

import com.kosta.book.admin.mSales.model.SalesListVO;
import com.kosta.cart.model.CartVO;

public interface PayDAO {
	
	public void insertSaleList(SalesListVO vo);
	public void insertGetDelivery(GetDeliveryVO vo);
	public List getOrderNo(String id);
	public void minusInventory(CartVO vo);
	public void updateDelivery(CartVO vo);

}
