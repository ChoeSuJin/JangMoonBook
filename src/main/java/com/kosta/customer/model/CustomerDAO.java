package com.kosta.customer.model;

import java.util.List;

public interface CustomerDAO {

	public boolean loginCheck(CustomerVO vo);  // 濡쒓렇�씤
	public CustomerVO loginCustomer(CustomerVO vo);	//濡쒓렇�씤 �꽦怨듭뿬遺�
	public List<CustomerVO> customerList(); // �쉶�썝 紐⑸줉
	public void insertCustomer(CustomerVO vo); //�쉶�썝媛��엯
	public CustomerVO viewCustomer(String id); //留덉씠�럹�씠吏�
	public void deleteCustomer(String id);  // �쉶�썝 �궘�젣
	public void updateCustomer(CustomerVO vo);  // �쉶�썝�젙蹂� �닔�젙
	public boolean checkPwd(String id, String pwd);	//鍮꾨�踰덊샇 泥댄겕
	public String getClass(CustomerVO vo);	//鍮꾨�踰덊샇 泥댄겕
	

}
