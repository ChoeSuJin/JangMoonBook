package com.kosta.customer.model;

import java.util.List;

import com.kosta.book.admin.mSales.model.SalesListVO;

public interface CustomerDAO {

	/**
	 * 구매한 Ebook 목록을 불러오는 메소드
	 * @param id
	 * @return <SalesListVO>
	 */
	public List<SalesListVO> myEbook(String id); 
	/**
	 * Ebook을 제외한 구매목록을 불러오는 메소드
	 * @param id
	 * @return <SalesListVO>
	 */
	public List<SalesListVO> saleList(String id);
	/**
	 * 베스트셀러 목록을 불러오는 메소드
	 * @return List<BookVO>
	 */
	public List<BookVO> bestSeller();
	/**
	 * 새로 입고된 책을 불러오는 메소드
	 * @return List<BookVO>
	 */
	public List<BookVO> newBook();
	/**
	 * 로그인 여부를 확인하는 메소드
	 * @param vo
	 * @return boolean
	 */
	public boolean loginCheck(CustomerVO vo); 
	/**
	 * 로그인한 유저의 정보를 가져오는 메소드
	 * @param vo
	 * @return CustomerVO
	 */
	public CustomerVO loginCustomer(CustomerVO vo);	
	/**
	 * 유저 목록을 불러오는 메소드
	 * @return List<CustomerVO>
	 */
	public List<CustomerVO> customerList();
	/**
	 * 회원가입을 처리하는 메소드
	 * @param vo
	 */
	public void insertCustomer(CustomerVO vo);
	/**
	 * 유저 정보를 가져오는 메소드
	 * @param id
	 * @return CustomerVO
	 */
	public CustomerVO viewCustomer(String id);
	/**
	 * 회원 탈퇴를 처리하는 메소드
	 * @param id
	 */
	public void deleteCustomer(String id);
	/**
	 * 회원정보 수정을 처리하는 메소드
	 * @param vo
	 */
	public void updateCustomer(CustomerVO vo);
	/**
	 * 비밀번호 일치여부를 확인하는 메소드
	 * @param id
	 * @param pwd
	 * @return boolean
	 */
	public boolean checkPwd(String id, String pwd);
	/**
	 * mypage에서 비밀번호를 확인하는 메소드
	 * @param vo
	 * @return int
	 */
	public int checkPwdMypage(CustomerVO vo);
	/**
	 * 유저의 등급을 가져오는 메소드
	 * @param vo
	 * @return String
	 */
	public String getClass(CustomerVO vo);
	/**
	 * 아이디 중복체크를 수행하는 메소드
	 * @param id
	 * @return boolean
	 */
	public boolean idCheck(String id);
	/**
	 * 비밀번호 찾기를 수행하는 메소드
	 * @param vo
	 * @return CustomerVO
	 */
	public CustomerVO pwdCheck(CustomerVO vo);
}
