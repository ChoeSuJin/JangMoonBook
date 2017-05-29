package com.kosta.customer.model;

import java.util.ArrayList;

public interface NoticeDAO {
	public void noticeWrite(NoticeVO noticeVO);
	public NoticeVO detailView(NoticeVO noticeVO);
	public ArrayList<NoticeVO> noticeList();
	
	/*	public ArrayList<NoticeVO> listDao();
	public void writeDao(NoticeVO vo);
	public ArrayList<NoticeVO> viewDao(NoticeVO vo);
	public void deleteDao(NoticeVO vo);*/
}
