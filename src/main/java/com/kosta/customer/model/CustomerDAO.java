package com.kosta.customer.model;

import java.util.List;

import com.kosta.book.admin.mSales.model.SalesListVO;

public interface CustomerDAO {

	
	public List<SalesListVO> myEbook(String id);  
	public List<SalesListVO> saleList(String id);  
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
	public int checkPwdMypage(CustomerVO vo);	
	public String getClass(CustomerVO vo);	
	public boolean idCheck(String id);//아이디 중복체크
	public CustomerVO pwdCheck(CustomerVO vo);// 비밀번호 찾기

}
