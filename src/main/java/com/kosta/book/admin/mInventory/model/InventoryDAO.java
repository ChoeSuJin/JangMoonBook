package com.kosta.book.admin.mInventory.model;

import java.util.List;

import com.kosta.pay.model.GetDirectVO;

public interface InventoryDAO {
	
	/**
	 * �ֹ���� ���� ����Ʈ�� �ҷ����� �޼ҵ�
	 * @param branch
	 * @return List<InventoryVO>
	 */
	public List<InventoryVO> selectEmergency(String branch);
	/**
	 * �Ϲ� ��� ����Ʈ�� �ҷ����� �޼ҵ�
	 * @param branch
	 * @return List<InventoryVO>
	 */
	public List<InventoryVO> selectNormal(String branch);
	/**
	 * ���ֿ�û�� ���� ����Ʈ�� �ҷ����� �޼ҵ�
	 * @param branch
	 * @return List<OrderListVO>
	 */
	public List<OrderListVO> selectOrderList(String branch);
	/**
	 * �������� ����� �ҷ����� ����Ʈ
	 * @param branch
	 * @return List<GetDirectVO>
	 */
	public List<GetDirectVO> selectGetDirectList(String branch);
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
	/**
	 * �������� ��Ͽ��� �����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void deleteGetDirect(GetDirectVO vo);
	/**
	 * ��å�� ����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void newBookInsert(BookInfoVO vo);
	/**
	 * ����� ������ ���ҽ�Ű�� �޼ҵ�
	 * @param vo
	 */
	public void minusInventory(GetDirectVO vo);
	/**
	 * ���ҿ��θ� ������Ʈ�ϴ� �޼ҵ�
	 * @param vo
	 */
	public void updatePaid(GetDirectVO vo);

}
