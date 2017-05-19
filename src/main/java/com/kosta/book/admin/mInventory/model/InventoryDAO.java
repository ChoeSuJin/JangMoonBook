package com.kosta.book.admin.mInventory.model;

import java.util.List;

import com.kosta.book.admin.mSales.model.SalesListVO;

public interface InventoryDAO {
	
	public List<InventoryVO> selectEmergency(String branch);
	public List<InventoryVO> selectNormal(String branch);
	public List<OrderListVO> selectOrderList(String branch);
	public int getCost(String isbn);
	public String getPublisher(String isbn);
	public void insertOrderList(OrderListVO vo);
	public void orderConfirm(OrderListVO vo);
	public void deleteOrder(OrderListVO vo);
	public void newBookInsert(BookInfoVO vo);

}
