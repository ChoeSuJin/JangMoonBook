package com.kosta.book.admin.mSales.model;

import java.util.List;

public interface SalesDAO {
	
	public List<SalesListVO> saleNewBook(SalesListVO vo);
	public List<SalesListVO> saleForeignBook(SalesListVO vo);
	public String sumSaleDomesticBook(SalesListVO vo);
	public String sumSaleForeignBook(SalesListVO vo);
	
}
