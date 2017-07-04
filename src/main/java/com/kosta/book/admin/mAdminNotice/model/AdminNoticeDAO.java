package com.kosta.book.admin.mAdminNotice.model;

import java.util.List;

public interface AdminNoticeDAO {
	/**
	 * 사내 공지사항을 등록하는 메소드
	 * @param vo
	 */
	public void regAdminNotice(AdminNoticeVO vo);
	
	/**
	 * 사내 공지사항 목록을 불러오는 메소드
	 * @return List<AdminNoticeVO>
	 */
	public List<AdminNoticeVO> getAdminNotice();
	
	/**
	 * 사내 공지사항을 수정하는 메소드
	 * @param vo
	 */
	public void deleteAdminNotice(AdminNoticeVO vo);
	
	/**
	 * 오늘 등록된 사내 공지사항을 읽어오는 메소드
	 * @return int
	 */
	public int getTodayNotice();

}
