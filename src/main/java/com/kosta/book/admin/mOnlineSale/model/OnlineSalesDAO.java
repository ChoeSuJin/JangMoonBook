package com.kosta.book.admin.mOnlineSale.model;

import java.util.List;

public interface OnlineSalesDAO {
	
	/**
	 * �¶��� �ǸŸ���Ʈ�� �ҷ����� ����Ʈ
	 * @return List<SalesListVO>
	 */
	public List<SalesListVO> saleOnlineBook();
	/**
	 * �������� �Ǹűݾ��� ����ϴ� �޼ҵ�
	 * @return String
	 */
	public String sumSaleOnlineDomesticBook();
	/**
	 * �ܱ����� �Ǹűݾ��� ����ϴ� �޼ҵ�
	 * @return String
	 */
	public String sumSaleOnlineForeignBook();
}
