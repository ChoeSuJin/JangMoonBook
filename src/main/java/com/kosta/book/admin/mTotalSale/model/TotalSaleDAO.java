package com.kosta.book.admin.mTotalSale.model;

import java.util.List;

public interface TotalSaleDAO {
	
	/**
	 * ��ü �������� �ǸŸ���Ʈ�� �ҷ����� �޼ҵ�
	 * @return
	 */
	public List<Integer> getDomesticList();
	/**
	 * ��ü �ܱ����� �ǸŸ���Ʈ�� �ҷ����� �޼ҵ�
	 * @return
	 */
	public List<Integer> getForeignList();
	

}
