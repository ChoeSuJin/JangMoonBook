package com.kosta.customer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.customer.model.CustomerDAOImpl;
import com.kosta.customer.model.CustomerVO;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Inject
	CustomerDAOImpl customerDAO;
	
	@Override
	public List<CustomerVO> customerList() {
		return customerDAO.customerList();
	}

	@Override
	public void insertCustomer(CustomerVO vo) {
		customerDAO.insertCustomer(vo);
		
	}

	@Override
	public CustomerVO viewCustomer() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteCustomer(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCustomer(CustomerVO vo) {
		// TODO Auto-generated method stub
		
	}

}
