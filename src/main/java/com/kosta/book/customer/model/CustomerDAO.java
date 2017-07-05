package com.kosta.book.customer.model;

import java.util.List;

public interface CustomerDAO {

	public boolean loginCheck(CustomerVO vo);  // 濡쒓?���씤
	public CustomerVO loginCustomer(CustomerVO vo);	//濡쒓?���씤 �꽦?�듭뿬遺�?
	public List<CustomerVO> customerList(); // �쉶�썝 紐⑸�?
	public void insertCustomer(CustomerVO vo); //�쉶�썝媛��엯
	public CustomerVO viewCustomer(String id); //留덉?���럹�씠吏�
	public void deleteCustomer(String id);  // �쉶�썝 �궘�젣
	public void updateCustomer(CustomerVO vo);  // �쉶�썝�젙蹂� �닔�젙
	public boolean checkPwd(String id, String pwd);	//?��꾨�踰덊?�� 泥댄�?
	public String getClass(CustomerVO vo);	//?��꾨�踰덊?�� 泥댄�?
	

}
