package com.kosta.customer.service;

import java.util.List;

import com.kosta.customer.model.CustomerVO;

public interface CustomerService {
	
	public List<CustomerVO> customerList(); // 회원 목록
	public void insertCustomer(CustomerVO vo); //회원가입
	public CustomerVO viewCustomer(); //마이페이지
	public void deleteCustomer(String id);  // 회원 삭제
	public void updateCustomer(CustomerVO vo);  // 회원정보 수정
}
