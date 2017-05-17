package com.kosta.customer.model;

import java.util.ArrayList;

public interface CustomerDAO {
	public ArrayList<CustomerVO> listDao();
	public void writeDao(String mWriter, String mContent);
	public ArrayList<CustomerVO> viewDao(String mWriter);
	public void deleteDao(String bId);
}
