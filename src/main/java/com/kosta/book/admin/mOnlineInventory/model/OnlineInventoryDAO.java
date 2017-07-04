package com.kosta.book.admin.mOnlineInventory.model;

import java.util.List;

import com.kosta.pay.model.GetDirectVO;

public interface OnlineInventoryDAO {
	
	/**
	 * �¶��� �ֹ���� ��������Ʈ�� �ҷ����� �޼ҵ�
	 * @return List<InventoryVO>
	 */
	public List<InventoryVO> selectEmergency();
	/**
	 * �¶��� �Ϲ� ��� ����Ʈ�� �ҷ����� �޼ҵ�
	 * @return List<InventoryVO>
	 */
	public List<InventoryVO> selectNormal();
	/**
	 * �¶��� ���� ����� �ҷ����� �޼ҵ�
	 * @return List<OrderListVO>
	 */
	public List<OrderListVO> selectOrderList();
	/**
	 * ������ �ҷ����� �޼ҵ�
	 * @param isbn
	 * @return int
	 */
	public int getCost(String isbn);
	/**
	 * ���ڸ� �ҷ����� �޼ҵ�
	 * @param isbn
	 * @return String
	 */
	public String getPublisher(String isbn);
	/**
	 * ���ָ� ����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void insertOrderList(OrderListVO vo);
	/**
	 * �԰� Ȯ���ϴ� �޼ҵ�
	 * @param vo
	 */
	public void orderConfirm(OrderListVO vo);
	/**
	 * �԰��Ͽ��� �����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void deleteOrder(OrderListVO vo);

}
