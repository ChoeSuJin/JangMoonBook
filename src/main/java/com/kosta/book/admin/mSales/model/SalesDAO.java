package com.kosta.book.admin.mSales.model;

import java.util.List;

public interface SalesDAO {
	
	/**
	 * �������� �ǸŸ���Ʈ�� �ҷ����� �޼ҵ�
	 * @param vo
	 * @return List<SalesListVO>
	 */
	public List<SalesListVO> saleNewBook(SalesListVO vo);
	/**
	 * �ܱ����� �Ǹ� ����Ʈ�� �Ҿ���� �޼ҵ�
	 * @param vo
	 * @return List<SalesListVO>
	 */
	public List<SalesListVO> saleForeignBook(SalesListVO vo);
	/**
	 * �������� �Ǹűݾ��� ����ϴ� �޼ҵ�
	 * @return String
	 */
	public String sumSaleDomesticBook(SalesListVO vo);
	/**
	 * �ܱ����� �Ǹűݾ��� ����ϴ� �޼ҵ�
	 * @return String
	 */
	public String sumSaleForeignBook(SalesListVO vo);
	
}
