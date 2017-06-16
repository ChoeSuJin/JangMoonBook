package com.kosta.pay.model;

import java.util.List;

import com.kosta.book.admin.mSales.model.SalesListVO;
import com.kosta.cart.model.CartVO;
import com.kosta.customer.model.CustomerVO;

public interface PayDAO {
	
	/**
	 * �Ǹ� ��Ͽ� �߰��ϴ� �޼ҵ�
	 * @param vo
	 */
	public void insertSaleList(SalesListVO vo);
	/**
	 * ��۸�Ͽ� �߰��ϴ� �޼ҵ�
	 * @param vo
	 */
	public void insertGetDelivery(GetDeliveryVO vo);
	/**
	 * �ֹ���ȣ ����Ʈ�� ������� �޼ҵ�
	 * @param id
	 * @return List
	 */
	public List getOrderNo(String id);
	/**
	 * �¶��� ��� �����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void minusOnlineInventory(CartVO vo);
	/**
	 * ���� ��� �����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void minusDirectInventory(SalesListVO vo);
	/**
	 * ��۸���� ������Ʈ�ϴ� �޼ҵ�
	 * @param vo
	 */
	public void updateDelivery(CartVO vo);
	/**
	 * �������ɸ���� ������Ʈ�ϴ� �޼ҵ�
	 * @param vo
	 */
	public void updateGetDirect(CartVO vo);
	/**
	 * ���� ���ɿ��� ���ɽ� ������ �߰��ϴ� �޼ҵ�
	 * @param vo
	 */
	public void insertGetPay(GetDirectVO vo);
	/**
	 * ���� ���ɿ��� ������ ������ �߰��ϴ� �޼ҵ�
	 * @param vo
	 */
	public void insertNowPay(GetDirectVO vo);
	
	/**
	 * �������� �������� �޼ҵ�
	 * @param id
	 * @return String
	 */
	public String getDiscountRate(String id);
	/**
	 * 6������ ���űݾ��� �������� �޼ҵ�
	 * @param id
	 * @return
	 */
	public int sum6MonthSale(String id);
	/**
	 * �������� �������� �޼ҵ�
	 * @param id
	 * @return CustomerVO
	 */
	public CustomerVO getCustomerInfo(String id);
	/**
	 * ���űݾ׿� ���� ���� ����� �����ϴ� �޼ҵ�
	 * @param id
	 * @param newClass
	 */
	public void updateCustomerClass(String id, String newClass);
	

}
