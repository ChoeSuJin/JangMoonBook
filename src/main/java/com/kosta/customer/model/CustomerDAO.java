package com.kosta.customer.model;

import java.util.List;

public interface CustomerDAO {

	public boolean loginCheck(CustomerVO vo);  // 로그인
	public CustomerVO loginCustomer(CustomerVO vo);	//로그인 성공여부
	public List<CustomerVO> customerList(); // 회원 목록
	public void insertCustomer(CustomerVO vo); //회원가입
	public CustomerVO viewCustomer(String id); //마이페이지
	public void deleteCustomer(String id);  // 회원 삭제
	public void updateCustomer(CustomerVO vo);  // 회원정보 수정
	public boolean checkPwd(String id, String pwd);	//비밀번호 체크
	

}
