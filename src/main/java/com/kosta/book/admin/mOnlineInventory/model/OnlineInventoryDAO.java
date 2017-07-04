package com.kosta.book.admin.mOnlineInventory.model;

import java.util.List;

import com.kosta.pay.model.GetDirectVO;

public interface OnlineInventoryDAO {
	
	/**
	 * 온라인 주문요망 도서리스트를 불러오는 메소드
	 * @return List<InventoryVO>
	 */
	public List<InventoryVO> selectEmergency();
	/**
	 * 온라인 일반 재고 리스트를 불러오는 메소드
	 * @return List<InventoryVO>
	 */
	public List<InventoryVO> selectNormal();
	/**
	 * 온라인 발주 목록을 불러오는 메소드
	 * @return List<OrderListVO>
	 */
	public List<OrderListVO> selectOrderList();
	/**
	 * 가격을 불러오는 메소드
	 * @param isbn
	 * @return int
	 */
	public int getCost(String isbn);
	/**
	 * 저자를 불러오는 메소드
	 * @param isbn
	 * @return String
	 */
	public String getPublisher(String isbn);
	/**
	 * 발주를 등록하는 메소드
	 * @param vo
	 */
	public void insertOrderList(OrderListVO vo);
	/**
	 * 입고를 확인하는 메소드
	 * @param vo
	 */
	public void orderConfirm(OrderListVO vo);
	/**
	 * 입고목록에서 삭제하는 메소드
	 * @param vo
	 */
	public void deleteOrder(OrderListVO vo);

}
