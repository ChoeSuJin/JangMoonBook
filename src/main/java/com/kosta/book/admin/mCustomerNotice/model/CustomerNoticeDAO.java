package com.kosta.book.admin.mCustomerNotice.model;

import java.util.List;

public interface CustomerNoticeDAO {
	
	/**
	 * �� ���������� �о���� �޼ҵ�
	 * @return List<CustomerNoticeVO>
	 */
	public List<CustomerNoticeVO> getList();
	/**
	 * �� ���������� ����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void regNotice(CustomerNoticeVO vo);

}
