package com.kosta.customer.model;

import java.util.List;

public interface BookDAO {
	
	public List<BookVO> bookNoTypeSearchDao(BookVO vo);
	public List<BookVO> bookSearchDao(BookVO vo);
	public List<BookVO> bookTypeSearchDao(BookVO vo);
	public BookVO bookOneSearchDao(BookVO vo);
	public void bookWrite(BookVO vo);
}
