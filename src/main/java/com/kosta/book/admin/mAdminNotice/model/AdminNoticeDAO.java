package com.kosta.book.admin.mAdminNotice.model;

import java.util.List;

public interface AdminNoticeDAO {
	/**
	 * �系 ���������� ����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void regAdminNotice(AdminNoticeVO vo);
	
	/**
	 * �系 �������� ����� �ҷ����� �޼ҵ�
	 * @return List<AdminNoticeVO>
	 */
	public List<AdminNoticeVO> getAdminNotice();
	
	/**
	 * �系 ���������� �����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void deleteAdminNotice(AdminNoticeVO vo);
	
	/**
	 * ���� ��ϵ� �系 ���������� �о���� �޼ҵ�
	 * @return int
	 */
	public int getTodayNotice();

}
