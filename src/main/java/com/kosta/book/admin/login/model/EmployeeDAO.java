package com.kosta.book.admin.login.model;

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

}
