package com.kosta.book.organ.login.model;

import java.util.List;

import com.kosta.book.admin.mInventory.model.BookInfoVO;

public interface OrganLoginDAO {
	public OrganLoginVO loginOrgan(OrganLoginVO vo);
	public List<BookInfoVO> ebookList();
}
