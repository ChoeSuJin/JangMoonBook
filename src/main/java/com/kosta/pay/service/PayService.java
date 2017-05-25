package com.kosta.pay.service;

import com.kosta.pay.model.PayVO;

public interface PayService {
	public void insert(PayVO vo) throws Exception;
	public PayVO view(int orderno) throws Exception;
	
}
