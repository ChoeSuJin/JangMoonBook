package com.kosta.book.customer.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kosta.book.customer.model.CustomerDAO;
import com.kosta.book.customer.model.CustomerVO;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Inject
	CustomerDAO customerDAO;
	
	@Override
	public boolean loginCheck(CustomerVO vo, HttpSession session) {
		boolean result =customerDAO.loginCheck(vo);
		if(result){
			CustomerVO vo2 = loginCustomer(vo);
			session.setAttribute("id", vo2.getId());
			session.setAttribute("pwd", vo2.getPwd());

		}
		return result;
	}

	
	@Override
	public String getClass(CustomerVO vo) {
		return customerDAO.getClass(vo);
	}


	@Override
	public CustomerVO loginCustomer(CustomerVO vo) {
		return customerDAO.loginCustomer(vo);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
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
