package com.kosta.book.organ.mOrgan.model;

import java.util.List;

import com.kosta.book.admin.mInventory.model.BookInfoVO;

public interface ManageOrganDAO {
	public void ebookReq(ManageOrganVO vo);
	public List<BookInfoVO> ebookList();
	public List<ManageOrganVO> ebookReqList(String com);
}
