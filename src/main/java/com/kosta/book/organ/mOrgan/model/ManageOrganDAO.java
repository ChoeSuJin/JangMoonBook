package com.kosta.book.organ.mOrgan.model;

import java.util.List;

import com.kosta.book.admin.mEbook.model.ManageEbookReqListVO;
import com.kosta.book.admin.mInventory.model.BookInfoVO;

public interface ManageOrganDAO {
	/**
	 * Ebook 대여요청을 넣는 메소드
	 * @param vo
	 */
	public void ebookReq(ManageOrganVO vo);
	/**
	 * Ebook 리스트를 불러오는 메소드
	 * @return List<BookInfoVO>
	 */
	public List<BookInfoVO> ebookList();
	/**
	 * Ebook 대여요청 리스트를 불러오는 메소드
	 * @param ono
	 * @return List<ManageEbookReqListVO>
	 */
	public List<ManageEbookReqListVO> ebookReqList(int ono);
	/**
	 * Ebook을 검색하는 메소드
	 * @param title
	 * @return List<BookInfoVO>
	 */
	public List<BookInfoVO> searchEbook(String title);
	/**
	 * 대여된 Ebook 목록을 불러오는 메소드
	 * @param vo
	 * @return List<ManageOrganVO>
	 */
	public List<ManageOrganVO> ebookDistList(ManageOrganVO vo);
}
