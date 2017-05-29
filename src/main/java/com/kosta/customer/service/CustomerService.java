package com.kosta.customer.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kosta.customer.model.CustomerVO;

public interface CustomerService {
	
	public boolean loginCheck(CustomerVO vo, HttpSession session);	//로그인
	public CustomerVO loginCustomer(CustomerVO vo);	//로그인 성공여부
	public void logout(HttpSession session);	//로그아웃
	public List<CustomerVO> customerList(); // 회원 목록
	public void insertCustomer(CustomerVO vo); //회원가입
	public CustomerVO viewCustomer(String id); //마이페이지
	public void deleteCustomer(String id);  // 회원 삭제
	public void updateCustomer(CustomerVO vo);  // 회원정보 수정
	public boolean checkPwd(String id, String pwd);	//비밀번호 체크
}
