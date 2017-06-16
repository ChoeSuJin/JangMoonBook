package com.kosta.customer.model;

import java.util.List;

public interface BookDAO {
	
	/**
	 * å�� �˻��ϴ� �޼ҵ�
	 * @param vo
	 * @return List<BookVO>
	 */
	public List<BookVO> searchBook(BookVO vo);
	/**
	 * ī�װ��� �˻��ϴ� �޼ҵ�
	 * @param vo
	 * @return List<BookVO>
	 */
	public List<BookVO> searchBookCategory(BookVO vo);
	/**
	 * typer�� ī�װ��� �̿��� å ����� �ҷ����� �޼ҵ�
	 * @param vo
	 * @return List<BookVO>
	 */
	public List<BookVO> orderBook(BookVO vo);
	/**
	 * ī�װ��� �̿��� å ����� �ҷ����� �޼ҵ�
	 * @param vo
	 * @return List<BookVO>
	 */
	public List<BookVO> orderBookCategory(BookVO vo);
	/**
	 * ���� �󼼺��⸦ ó���ϴ� �޼ҵ�
	 * @param vo
	 * @return BookVO
	 */
	public BookVO orderBookDetail(BookVO vo);
	
	/**
	 * å����� �ҷ����� ����Ʈ
	 * @param vo
	 * @return List<BookVO>
	 */
	public List<BookVO> bookSearchDao(BookVO vo);
}
