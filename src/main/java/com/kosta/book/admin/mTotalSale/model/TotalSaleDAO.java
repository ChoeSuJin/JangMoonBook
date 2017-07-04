package com.kosta.book.admin.mTotalSale.model;

import java.util.List;

public interface TotalSaleDAO {
	
	/**
	 * 전체 국내도서 판매리스트를 불러오는 메소드
	 * @return
	 */
	public List<Integer> getDomesticList();
	/**
	 * 전체 외국도서 판매리스트를 불러오는 메소드
	 * @return
	 */
	public List<Integer> getForeignList();
	

}
