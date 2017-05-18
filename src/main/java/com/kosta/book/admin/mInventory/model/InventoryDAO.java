package com.kosta.book.admin.mInventory.model;

import java.util.List;

import com.kosta.book.admin.mSales.model.SalesListVO;

public interface InventoryDAO {
	
	public List<InventoryVO> selectEmergency();
	public List<InventoryVO> selectNormal();
	public List<OrderListVO> selectOrderList();
	public void insertOrderList(OrderListVO vo);
	public void orderConfirm(OrderListVO vo);
	public void deleteOrder(OrderListVO vo);
	public void newBookInsert(BookInfoVO vo);

}
