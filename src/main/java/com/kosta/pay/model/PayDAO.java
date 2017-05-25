package com.kosta.pay.model;

public interface PayDAO {
	
	public void insert(PayVO vo) throws Exception;
	public PayVO view(int orderno) throws Exception;

}
