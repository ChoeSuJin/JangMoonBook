package com.kosta.customer.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kosta.customer.model.CustomerDAOImpl;
import com.kosta.customer.model.CustomerVO;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Inject
	CustomerDAOImpl customerDAO;
	
	@Override
	public boolean loginCheck(CustomerVO vo, HttpSession session) {
		boolean result =customerDAO.loginCheck(vo);
		if(result){
			//true 일 경우 세션 등록
			CustomerVO vo2 = loginCustomer(vo);
			//세션 변수 등록
			session.setAttribute("id", vo2.getId());
			session.setAttribute("pwd", vo2.getPwd());

		}
		return result;
	}


	@Override
	public CustomerVO loginCustomer(CustomerVO vo) {
		//아이디와 비밀번호가 모두 일치하는 디비있는지 확인
		
		return customerDAO.loginCustomer(vo);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
		//세션정보를 초기화 시킴
	}
	
	@Override
	public List<CustomerVO> customerList() {
		return customerDAO.customerList();
	}

	@Override
	public void insertCustomer(CustomerVO vo) {
		customerDAO.insertCustomer(vo);
		
	}

	@Override
	public CustomerVO viewCustomer(String id) {
		return customerDAO.viewCustomer(id);
	}

	@Override
	public void deleteCustomer(String id) {
		customerDAO.deleteCustomer(id);
		
	}

	@Override
	public void updateCustomer(CustomerVO vo) {
		customerDAO.updateCustomer(vo);
		
	}

	@Override
	public boolean checkPwd(String id, String pwd) {
		return customerDAO.checkPwd(id,pwd);
	}



}
