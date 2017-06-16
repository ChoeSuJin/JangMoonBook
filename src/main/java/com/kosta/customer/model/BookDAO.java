package com.kosta.customer.model;

import java.util.List;

public interface BookDAO {
	
	/**
	 * 책을 검색하는 메소드
	 * @param vo
	 * @return List<BookVO>
	 */
	public List<BookVO> searchBook(BookVO vo);
	/**
	 * 카테고리로 검색하는 메소드
	 * @param vo
	 * @return List<BookVO>
	 */
	public List<BookVO> searchBookCategory(BookVO vo);
	/**
	 * typer과 카테고리를 이용한 책 목록을 불러오는 메소드
	 * @param vo
	 * @return List<BookVO>
	 */
	public List<BookVO> orderBook(BookVO vo);
	/**
	 * 카테고리만 이용한 책 목록을 불러오는 메소드
	 * @param vo
	 * @return List<BookVO>
	 */
	public List<BookVO> orderBookCategory(BookVO vo);
	/**
	 * 도서 상세보기를 처리하는 메소드
	 * @param vo
	 * @return BookVO
	 */
	public BookVO orderBookDetail(BookVO vo);
	
	/**
	 * 책목록을 불러오는 리스트
	 * @param vo
	 * @return List<BookVO>
	 */
	public List<BookVO> bookSearchDao(BookVO vo);
}
