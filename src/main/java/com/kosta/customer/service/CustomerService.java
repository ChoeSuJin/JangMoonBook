package com.kosta.customer.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kosta.book.admin.mSales.model.SalesListVO;
import com.kosta.book.customer.model.BookVO;
import com.kosta.book.customer.model.CustomerVO;

public interface CustomerService {
	
	public List<SalesListVO> myEbook(String id);
	public List<SalesListVO> saleList(String id);
	public List<BookVO> bestSeller();
	public List<BookVO> newBook();
	public boolean loginCheck(CustomerVO vo, HttpSession session);
	public CustomerVO loginCustomer(CustomerVO vo);	
	public void logout(HttpSession session);	
	public List<CustomerVO> customerList(); 
	public void insertCustomer(CustomerVO vo);
	public CustomerVO viewCustomer(String id); 
	public void deleteCustomer(String id); 
	public void updateCustomer(CustomerVO vo);
	public boolean checkPwd(String id, String pwd);
	public int checkPwdMypage(CustomerVO vo);
	public String getClass(CustomerVO vo);
	public CustomerVO pwdCheck(CustomerVO vo);
	public boolean idCheck(String id);
}