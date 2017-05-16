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
	public CustomerVO viewCustomer(String id) {
		return sqlSession.selectOne("customer.viewCustomer", id);
	}

	@Override
	public void deleteCustomer(String id) {
		sqlSession.delete("customer.deleteCustomer", id);
		
	}

	@Override
	public void updateCustomer(CustomerVO vo) {
		sqlSession.update("customer.updateCustomer", vo);
		
	}

}
