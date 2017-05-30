package com.kosta.customer.model;

import java.util.List;

public interface BookDAO {
	
	public List<BookVO> searchBook(BookVO vo);
	public List<BookVO> orderBook(BookVO vo);
	public BookVO orderBookDetail(BookVO vo);
	
	public List<BookVO> bookNoTypeSearchDao(BookVO vo);
	public List<BookVO> bookSearchDao(BookVO vo);
	public List<BookVO> bookTypeSearchDao(BookVO vo);
	public BookVO bookOneSearchDao(BookVO vo);
	public void bookWrite(BookVO vo);
	public List<BookVO> usedSelectDao(BookVO vo);
	public List<BookVO> allList();
	
}
