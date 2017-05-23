package com.kosta.customer.model;

import java.util.ArrayList;

public interface NoticeDAO {
	public ArrayList<NoticeVO> listDao();
	public void writeDao(NoticeVO vo);
	public ArrayList<NoticeVO> viewDao(NoticeVO vo);
	public void deleteDao(NoticeVO vo);
}
