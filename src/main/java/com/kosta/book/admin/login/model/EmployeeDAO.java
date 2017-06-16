package com.kosta.book.admin.login.model;

public interface EmployeeDAO {
	
	/**
	 * Admin 로그인 메소드
	 * @param empNo
	 * @return EmployeeVO
	 */
	public EmployeeVO loginEmployee(int empNo);
	/**
	 * 미처리 QnA 갯수를 읽어오는 메소드
	 * @return int
	 */
	public int getCountNotDoQnA();
	/**
	 * 입고요망 도서 갯수를 읽어오는 메소드
	 * @param branch
	 * @return int
	 */
	public int getCountEmergencyBook(String branch);
	/**
	 * 오늘 직접수령하는 도서 건수를 읽어오는 메소드
	 * @param branch
	 * @return int
	 */
	public int getCountDirectBook(String branch);
	/**
	 * Ebook 대여요청을 읽어오는 메소드
	 * @return int
	 */
	public int getCountRequestEbook();

}
