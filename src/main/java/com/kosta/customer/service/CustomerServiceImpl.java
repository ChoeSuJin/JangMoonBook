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
			//true �씪 寃쎌슦 �꽭�뀡 �벑濡�
			CustomerVO vo2 = loginCustomer(vo);
			//�꽭�뀡 蹂��닔 �벑濡�
			session.setAttribute("id", vo2.getId());
			session.setAttribute("pwd", vo2.getPwd());

		}
		return result;
	}

	@Override
	public CustomerVO loginCustomer(CustomerVO vo) {
		//�븘�씠�뵒�� 鍮꾨�踰덊샇媛� 紐⑤몢 �씪移섑븯�뒗 �뵒鍮꾩엳�뒗吏� �솗�씤
		return customerDAO.loginCustomer(vo);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
		//�꽭�뀡�젙蹂대�� 珥덇린�솕 �떆�궡
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
