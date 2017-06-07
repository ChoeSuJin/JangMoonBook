package com.kosta.customer.model;

import java.util.List;

public interface CustomerDAO {

	public List<BookVO> bestSeller();  
	public List<BookVO> newBook();  
	public boolean loginCheck(CustomerVO vo);  
	public CustomerVO loginCustomer(CustomerVO vo);	
	public List<CustomerVO> customerList();
	public void insertCustomer(CustomerVO vo); 
	public CustomerVO viewCustomer(String id); 
	public void deleteCustomer(String id);  
	public void updateCustomer(CustomerVO vo); 
	public boolean checkPwd(String id, String pwd);	
	public String getClass(CustomerVO vo);	
	

}
