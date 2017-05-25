package com.kosta.pay.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.pay.model.PayDAO;
import com.kosta.pay.model.PayVO;

@Service
public class PayServiceImpl implements PayService{

	@Inject
	PayDAO payDAO;

	@Override
	public void insert(PayVO vo) throws Exception {
		payDAO.insert(vo);
	}

	@Override
	public PayVO view(int orderno) throws Exception {
		return payDAO.view(orderno);
	}
	
}
