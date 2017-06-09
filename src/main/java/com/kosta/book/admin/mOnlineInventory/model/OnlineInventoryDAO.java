package com.kosta.book.admin.mOnlineInventory.model;

import java.util.List;

import com.kosta.pay.model.GetDirectVO;

public interface OnlineInventoryDAO {
	
	public List<InventoryVO> selectEmergency();
	public List<InventoryVO> selectNormal();
	public List<OrderListVO> selectOrderList();
	public int getCost(String isbn);
	public String getPublisher(String isbn);
	public void insertOrderList(OrderListVO vo);
	public void orderConfirm(OrderListVO vo);
	public void deleteOrder(OrderListVO vo);

}
