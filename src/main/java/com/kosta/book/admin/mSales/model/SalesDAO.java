package com.kosta.book.admin.mSales.model;

import java.util.List;

public interface SalesDAO {
	
	public List<SalesListVO> saleNewBook(SalesListVO vo);
	public List<SalesListVO> saleUsedBook(SalesListVO vo);
	public String sumSaleNewBook(SalesListVO vo);
	public String sumSaleUsedBook(SalesListVO vo);
	
}
