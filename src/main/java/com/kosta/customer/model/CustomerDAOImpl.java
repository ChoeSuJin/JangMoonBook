package com.kosta.customer.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(CustomerVO vo) {
		String name = sqlSession.selectOne("customer.loginCheck", vo);
		
		return (name==null)? false : true;
	}
	
	@Override
	public String getClass(CustomerVO vo) {
		return sqlSession.selectOne("customer.getClass", vo);
	}

	@Override
	public CustomerVO loginCustomer(CustomerVO vo) {
		return sqlSession.selectOne("customer.loginCustomer", vo);
	}

	
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

	@Override
	public boolean checkPwd(String id, String pwd) {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		int count= sqlSession.selectOne("customer.checkPwd", map);
		if(count==1) result = true;
		return result;
	}

	
	

}
