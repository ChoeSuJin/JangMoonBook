package com.kosta.book.admin.mCustomerNotice.model;

import java.util.List;

public interface CustomerNoticeDAO {
	
	public List<CustomerNoticeVO> getList();
	public void regNotice(CustomerNoticeVO vo);

}
