package com.kosta.customer.model;

import java.util.List;

public interface BookDAO {
	
	public List<BookVO> bookSearchDao(BookVO vo);
	public BookVO bookOneSearchDao(BookVO vo);
	public void bookWrite(BookVO vo);
}
