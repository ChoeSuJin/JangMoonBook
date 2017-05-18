package com.kosta.customer.model;

import java.util.ArrayList;

public interface BookDAO {
	
	public BookVO bookSearchDao(String type, String title, String category);

}
