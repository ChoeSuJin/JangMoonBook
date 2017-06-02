package com.kosta.customer.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kosta.customer.model.CustomerVO;

public interface CustomerService {
	
	public boolean loginCheck(CustomerVO vo, HttpSession session);
	public CustomerVO loginCustomer(CustomerVO vo);	
	public void logout(HttpSession session);	
	public List<CustomerVO> customerList(); 
	public void insertCustomer(CustomerVO vo);
	public CustomerVO viewCustomer(String id); 
	public void deleteCustomer(String id); 
	public void updateCustomer(CustomerVO vo);
	public boolean checkPwd(String id, String pwd);
	public String getClass(CustomerVO vo);
}
