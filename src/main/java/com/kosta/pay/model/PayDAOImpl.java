package com.kosta.pay.model;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAOImpl implements PayDAO{

	@Inject
	SqlSession sqlSession;

	@Override
	public void insert(PayVO vo) throws Exception {
		sqlSession.insert("pay.insert", vo);
	}

	@Override
	public PayVO view(int orderno) throws Exception {
		return sqlSession.selectOne("pay.orderview", orderno);
	}
	
	
}
