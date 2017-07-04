package com.kosta.book.admin.mOnlineSale.model;

import java.util.List;

public interface OnlineSalesDAO {
	
	/**
	 * 온라인 판매리스트를 불러오는 리스트
	 * @return List<SalesListVO>
	 */
	public List<SalesListVO> saleOnlineBook();
	/**
	 * 국내도서 판매금액을 계산하는 메소드
	 * @return String
	 */
	public String sumSaleOnlineDomesticBook();
	/**
	 * 외국도서 판매금액을 계산하는 메소드
	 * @return String
	 */
	public String sumSaleOnlineForeignBook();
}
