package com.kosta.book.admin.mAdminNotice.model;

import java.util.List;

public interface AdminNoticeDAO {
	
	public void regAdminNotice(AdminNoticeVO vo);
	
	public List<AdminNoticeVO> getAdminNotice();
	
	public void deleteAdminNotice(AdminNoticeVO vo);

}
