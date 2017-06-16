package com.kosta.pay.model;

import java.util.List;

import com.kosta.book.admin.mSales.model.SalesListVO;
import com.kosta.cart.model.CartVO;
import com.kosta.customer.model.CustomerVO;

public interface PayDAO {
	
	/**
	 * 판매 목록에 추가하는 메소드
	 * @param vo
	 */
	public void insertSaleList(SalesListVO vo);
	/**
	 * 배송목록에 추가하는 메소드
	 * @param vo
	 */
	public void insertGetDelivery(GetDeliveryVO vo);
	/**
	 * 주문번호 리스트를 가져요는 메소드
	 * @param id
	 * @return List
	 */
	public List getOrderNo(String id);
	/**
	 * 온라인 재고를 차감하는 메소드
	 * @param vo
	 */
	public void minusOnlineInventory(CartVO vo);
	/**
	 * 지점 재고를 차감하는 메소드
	 * @param vo
	 */
	public void minusDirectInventory(SalesListVO vo);
	/**
	 * 배송목록을 업데이트하는 메소드
	 * @param vo
	 */
	public void updateDelivery(CartVO vo);
	/**
	 * 직접수령목록을 업데이트하는 메소드
	 * @param vo
	 */
	public void updateGetDirect(CartVO vo);
	/**
	 * 직접 수령에서 수령시 지불을 추가하는 메소드
	 * @param vo
	 */
	public void insertGetPay(GetDirectVO vo);
	/**
	 * 직접 수령에서 결제후 수령을 추가하는 메소드
	 * @param vo
	 */
	public void insertNowPay(GetDirectVO vo);
	
	/**
	 * 할인율을 가져오는 메소드
	 * @param id
	 * @return String
	 */
	public String getDiscountRate(String id);
	/**
	 * 6개월간 구매금액을 가져오는 메소드
	 * @param id
	 * @return
	 */
	public int sum6MonthSale(String id);
	/**
	 * 고객정보를 가져오는 메소드
	 * @param id
	 * @return CustomerVO
	 */
	public CustomerVO getCustomerInfo(String id);
	/**
	 * 구매금액에 따라 고객의 등급을 조정하는 메소드
	 * @param id
	 * @param newClass
	 */
	public void updateCustomerClass(String id, String newClass);
	

}
