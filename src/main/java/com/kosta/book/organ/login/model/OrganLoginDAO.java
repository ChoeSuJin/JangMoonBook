package com.kosta.book.organ.login.model;

import java.util.List;

import com.kosta.book.admin.mInventory.model.BookInfoVO;

public interface OrganLoginDAO {
	/**
	 * 기관 로그인메소드
	 * @param vo
	 * @return OrganLoginVO
	 */
	public OrganLoginVO loginOrgan(OrganLoginVO vo);
	/**
	 * 등록된 Ebook리스트를 불러오는 메소드
	 * @return List<BookInfoVO>
	 */
	public List<BookInfoVO> ebookList();
}
