package com.kosta.book.organ.mOrgan.model;

import java.util.List;

import com.kosta.book.admin.mEbook.model.ManageEbookReqListVO;
import com.kosta.book.admin.mInventory.model.BookInfoVO;

public interface ManageOrganDAO {
	public void ebookReq(ManageOrganVO vo);
	public List<BookInfoVO> ebookList();
	public List<ManageEbookReqListVO> ebookReqList(int ono);
	public List<BookInfoVO> searchEbook(String title);
	public List<ManageOrganVO> ebookDistList(ManageOrganVO vo);
}
