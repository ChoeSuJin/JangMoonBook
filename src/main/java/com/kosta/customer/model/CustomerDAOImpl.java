package com.kosta.customer.model;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<CustomerVO> customerList() {
		return sqlSession.selectList("customer.customerList");
	}

	@Override
	public void insertCustomer(CustomerVO vo) {
		sqlSession.insert("customer.insertCustomer", vo);
		
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
