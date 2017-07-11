package com.kosta.book.admin.login.model;

import java.util.List;

import com.kosta.book.admin.mInventory.model.OrderListVO;
import com.kosta.customer.model.BookVO;

public interface EmployeeDAO {
	
	/**
	 * Admin �α��� �޼ҵ�
	 * @param empNo
	 * @return EmployeeVO
	 */
	public EmployeeVO loginEmployee(int empNo);
	/**
	 * ��ó�� QnA ������ �о���� �޼ҵ�
	 * @return int
	 */
	public int getCountNotDoQnA();
	/**
	 * �԰��� ���� ������ �о���� �޼ҵ�
	 * @param branch
	 * @return int
	 */
	public int getCountEmergencyBook(String branch);
	/**
	 * ���� ���������ϴ� ���� �Ǽ��� �о���� �޼ҵ�
	 * @param branch
	 * @return int
	 */
	public int getCountDirectBook(String branch);
	/**
	 * Ebook �뿩��û�� �о���� �޼ҵ�
	 * @return int
	 */
	public int getCountRequestEbook();
	public int getInventory(String branch);
	public List<BookVO> newBook();
	public List<OrderListVO> latestOrder(String branch);

}
