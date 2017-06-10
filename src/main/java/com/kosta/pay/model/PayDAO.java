package com.kosta.pay.model;

import java.util.List;

import com.kosta.book.admin.mSales.model.SalesListVO;
import com.kosta.cart.model.CartVO;
import com.kosta.customer.model.CustomerVO;

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
	
	public String getDiscountRate(String id);
	public int sum6MonthSale(String id);
	public CustomerVO getCustomerInfo(String id);
	public void updateCustomerClass(String id, String newClass);
	

}
