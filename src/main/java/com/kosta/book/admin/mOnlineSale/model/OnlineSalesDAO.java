package com.kosta.book.admin.mOnlineSale.model;

import java.util.List;

public interface OnlineSalesDAO {
	
	public List<SalesListVO> saleOnlineBook();
	public String sumSaleOnlineDomesticBook();
	public String sumSaleOnlineForeignBook();
}
