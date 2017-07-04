package com.kosta.book.organ.mOrgan.model;

import java.util.List;

import com.kosta.book.admin.mEbook.model.ManageEbookReqListVO;
import com.kosta.book.admin.mInventory.model.BookInfoVO;

public interface ManageOrganDAO {
	/**
	 * Ebook �뿩��û�� �ִ� �޼ҵ�
	 * @param vo
	 */
	public void ebookReq(ManageOrganVO vo);
	/**
	 * Ebook ����Ʈ�� �ҷ����� �޼ҵ�
	 * @return List<BookInfoVO>
	 */
	public List<BookInfoVO> ebookList();
	/**
	 * Ebook �뿩��û ����Ʈ�� �ҷ����� �޼ҵ�
	 * @param ono
	 * @return List<ManageEbookReqListVO>
	 */
	public List<ManageEbookReqListVO> ebookReqList(int ono);
	/**
	 * Ebook�� �˻��ϴ� �޼ҵ�
	 * @param title
	 * @return List<BookInfoVO>
	 */
	public List<BookInfoVO> searchEbook(String title);
	/**
	 * �뿩�� Ebook ����� �ҷ����� �޼ҵ�
	 * @param vo
	 * @return List<ManageOrganVO>
	 */
	public List<ManageOrganVO> ebookDistList(ManageOrganVO vo);
}
