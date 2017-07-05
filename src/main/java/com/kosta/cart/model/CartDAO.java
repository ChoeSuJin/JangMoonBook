package com.kosta.cart.model;

import java.util.List;

import com.kosta.book.admin.mInventory.model.BookInfoVO;


public interface CartDAO {

	/**
	 * Ebook을 제외한 장바구니 목록을 불러오는 메소드
	 * @param id
	 * @return List<CartVO>
	 */
	public List<CartVO> listCart(String id);
	/**
	 * 장바구니에 담겨있는 Ebook 리스트를 불러오는 메소드
	 * @param id
	 * @return List<CartVO>
	 */
	public List<CartVO> listCartEbook(String id);
	/**
	 * 장바구니에 넣는 메소드
	 * @param vo
	 */
	public void insert(CartVO vo);
	/**
	 * 장바구니목록에서 지우는 메소드
	 * @param vo
	 */
	public void delete(BookInfoVO vo);
	/**
	 * 장바구니 상태를 업데이트하는 메소드
	 * @param cartno
	 */
	public void update(int cartno);
	/**
	 * Ebook을 제외한 총금액을 계산하는 메소드
	 * @param id
	 * @return int
	 */
	public int sumMoney(String id);
	/**
	 * Ebook 총금액을 계산하는 메소드
	 * @param id
	 * @return int
	 */
	public int sumMoneyEbook(String id);
	/**
	 * 장바구니에 담긴 수를 가져오는 메소드
	 * @param id
	 * @param isbn
	 * @return int
	 */
	public int countCart(String id, String isbn);
	/**
	 * 장바구니 상태를 업데이트하는 메소드
	 * @param cartno
	 */
	public void updateCart(CartVO vo);
	/**
	 * 장바구니 상태를 수정ㅇ하는 메소드
	 * @param vo
	 */
	public void modifyCart(CartVO vo);
	/**
	 * Ebook이 장바구니에 담긴지 확인하는 메소드
	 * @param vo
	 * @return int
	 */
	public int checkInsertEbook(CartVO vo);
	/**
	 * Ebook이 이미 구매된지 확인하는 메소드
	 * @param vo
	 * @return int
	 */
	public int checkInsertEbookSalelist(CartVO vo);
	
	/**
	 * 할인율을 가져오는 메소드
	 * @param id
	 * @return String
	 */
	public String getDiscountRate(String id);
}


