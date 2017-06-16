package com.kosta.book.admin.mSales.model;

import java.util.List;

public interface SalesDAO {
	
	/**
	 * 국내도서 판매리스트를 불러오는 메소드
	 * @param vo
	 * @return List<SalesListVO>
	 */
	public List<SalesListVO> saleNewBook(SalesListVO vo);
	/**
	 * 외국도서 판매 리스트를 불어오는 메소드
	 * @param vo
	 * @return List<SalesListVO>
	 */
	public List<SalesListVO> saleForeignBook(SalesListVO vo);
	/**
	 * 국내도서 판매금액을 계산하는 메소드
	 * @return String
	 */
	public String sumSaleDomesticBook(SalesListVO vo);
	/**
	 * 외국도서 판매금액을 계산하는 메소드
	 * @return String
	 */
	public String sumSaleForeignBook(SalesListVO vo);
	
}
