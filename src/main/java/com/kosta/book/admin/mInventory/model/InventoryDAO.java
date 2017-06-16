package com.kosta.book.admin.mInventory.model;

import java.util.List;

import com.kosta.pay.model.GetDirectVO;

public interface InventoryDAO {
	
	/**
	 * 주문요망 도서 리스트를 불러오는 메소드
	 * @param branch
	 * @return List<InventoryVO>
	 */
	public List<InventoryVO> selectEmergency(String branch);
	/**
	 * 일반 재고 리스트를 불러오는 메소드
	 * @param branch
	 * @return List<InventoryVO>
	 */
	public List<InventoryVO> selectNormal(String branch);
	/**
	 * 발주요청한 도서 리스트를 불러오는 메소드
	 * @param branch
	 * @return List<OrderListVO>
	 */
	public List<OrderListVO> selectOrderList(String branch);
	/**
	 * 직접수령 목록을 불러오는 리스트
	 * @param branch
	 * @return List<GetDirectVO>
	 */
	public List<GetDirectVO> selectGetDirectList(String branch);
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
	/**
	 * 직접수령 목록에서 삭제하는 메소드
	 * @param vo
	 */
	public void deleteGetDirect(GetDirectVO vo);
	/**
	 * 신책을 등록하는 메소드
	 * @param vo
	 */
	public void newBookInsert(BookInfoVO vo);
	/**
	 * 재고에서 수량을 감소시키는 메소드
	 * @param vo
	 */
	public void minusInventory(GetDirectVO vo);
	/**
	 * 지불여부를 업데이트하는 메소드
	 * @param vo
	 */
	public void updatePaid(GetDirectVO vo);

}
