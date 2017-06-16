package com.kosta.book.admin.mCustomerNotice.model;

import java.util.List;

public interface CustomerNoticeDAO {
	
	/**
	 * 고객 공지사항을 읽어오는 메소드
	 * @return List<CustomerNoticeVO>
	 */
	public List<CustomerNoticeVO> getList();
	/**
	 * 고객 공지사항을 등록하는 메소드
	 * @param vo
	 */
	public void regNotice(CustomerNoticeVO vo);

}
