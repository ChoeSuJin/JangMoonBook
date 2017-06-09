package com.kosta.book.admin.login.model;

public interface EmployeeDAO {
	
	public EmployeeVO loginEmployee(int empNo);
	public int getCountNotDoQnA();
	public int getCountEmergencyBook(String branch);
	public int getCountDirectBook(String branch);
	public int getCountRequestEbook();

}
