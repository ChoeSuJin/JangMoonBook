package com.kosta.book.admin.mEbook.model;

import java.util.List;

public interface ManageEbookDAO {
	

	/**
	 * Ebook �뿩 ����� ���� �������� �ҷ����� �޼ҵ�
	 * @return List<ManageEbookORganVO>
	 */
	public List<ManageEbookOrganVO> getEbookOrganList();
	/**
	 * ��ϵ� Ebook ����Ʈ�� �������� �޼ҵ�
	 * @param vo
	 * @return List<ManageEbookListVO>
	 */
	public List<ManageEbookListVO> getEbookList(ManageEbookOrganVO vo);
	/**
	 * �뿩��û�ϴ� Ebook ����Ʈ�� �������� �޼ҵ�
	 * @return List<ManageEbookReqListVO>
	 */
	public List<ManageEbookReqListVO> getEbookPermitList();
	/**
	 * ���Ⱓ ������ ��û�ϴ� �������Ʈ�� �������� �޼ҵ�
	 * @return List<ManageEbookExtendReqListVO>
	 */
	public List<ManageEbookExtendReqListVO> getEbookExtendReqList();
	
	/**
	 * ���ο� ����� ����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void insertNewCompany(ManageEbookOrganVO vo);
	/**
	 * Ebook �뿩��û�� �㰡�ϴ� �޼ҵ�
	 * @param vo
	 */
	public void insertEbookPermit(ManageEbookListVO vo);
	/**
	 * ���Ⱓ�� �����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void updateExtendOrgan(ManageEbookExtendReqListVO vo);
	
	/**
	 * Ebook �㰡�� �뿩��û ��Ͽ��� ����� �޼ҵ�
	 * @param vo
	 */
	public void deleteEbookPermit(ManageEbookReqListVO vo);
	/**
	 * ��� ������ �����û ��Ͽ��� ����� �޼ҵ�
	 * @param vo
	 */
	public void deleteExtendOrgan(ManageEbookExtendReqListVO vo);
	
	
	/**
	 * ��ü ��� ���� �ҷ����� �޼ҵ�
	 * @return int
	 */
	public int getAllOrganListCount();
}
