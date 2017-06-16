package com.kosta.book.organ.login.model;

import java.util.List;

import com.kosta.book.admin.mInventory.model.BookInfoVO;

public interface OrganLoginDAO {
	/**
	 * ��� �α��θ޼ҵ�
	 * @param vo
	 * @return OrganLoginVO
	 */
	public OrganLoginVO loginOrgan(OrganLoginVO vo);
	/**
	 * ��ϵ� Ebook����Ʈ�� �ҷ����� �޼ҵ�
	 * @return List<BookInfoVO>
	 */
	public List<BookInfoVO> ebookList();
}
