package com.kosta.book.admin.mSales.model;

import java.util.List;

public interface SalesDAO {
	
	public List<SalesListVO> saleNewBook(SalesListVO vo);
	public List<SalesListVO> saleUsedBook(SalesListVO vo);
	public int sumSaleNewBook(SalesListVO vo);
	public int sumSaleUsedBook(SalesListVO vo);
	
	

}
