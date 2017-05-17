package com.kosta.customer.model;

import java.util.ArrayList;

public interface NoticeDAO {
	public ArrayList<NoticeVO> listDao();
	public void writeDao(String title, String content);
	public ArrayList<NoticeVO> viewDao(String title);
	public void deleteDao(String title);
	public NoticeVO contentDao(String title);
}
