package com.kosta.pay.model;

import java.util.List;

import com.kosta.book.admin.mSales.model.SalesListVO;
import com.kosta.book.customer.cart.model.CartVO;

public interface PayDAO {
	
	public void insertSaleList(SalesListVO vo);
	public void insertGetDelivery(GetDeliveryVO vo);
	public List getOrderNo(String id);
	public void minusOnlineInventory(CartVO vo);
	public void minusDirectInventory(SalesListVO vo);
	public void updateDelivery(CartVO vo);
	public void updateGetDirect(CartVO vo);
	public void insertGetPay(GetDirectVO vo);
	public void insertNowPay(GetDirectVO vo);
}
