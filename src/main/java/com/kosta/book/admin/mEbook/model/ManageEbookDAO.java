package com.kosta.book.admin.mEbook.model;

import java.util.List;

public interface ManageEbookDAO {
	

	/**
	 * Ebook 대여 계약을 맺은 기업목록을 불러오는 메소드
	 * @return List<ManageEbookORganVO>
	 */
	public List<ManageEbookOrganVO> getEbookOrganList();
	/**
	 * 등록된 Ebook 리스트를 가져오는 메소드
	 * @param vo
	 * @return List<ManageEbookListVO>
	 */
	public List<ManageEbookListVO> getEbookList(ManageEbookOrganVO vo);
	/**
	 * 대여요청하는 Ebook 리스트를 가져오는 메소드
	 * @return List<ManageEbookReqListVO>
	 */
	public List<ManageEbookReqListVO> getEbookPermitList();
	/**
	 * 계약기간 연장을 요청하는 기업리스트를 가져오는 메소드
	 * @return List<ManageEbookExtendReqListVO>
	 */
	public List<ManageEbookExtendReqListVO> getEbookExtendReqList();
	
	/**
	 * 새로운 기업을 등록하는 메소드
	 * @param vo
	 */
	public void insertNewCompany(ManageEbookOrganVO vo);
	/**
	 * Ebook 대여요청을 허가하는 메소드
	 * @param vo
	 */
	public void insertEbookPermit(ManageEbookListVO vo);
	/**
	 * 계약기간을 연장하는 메소드
	 * @param vo
	 */
	public void updateExtendOrgan(ManageEbookExtendReqListVO vo);
	
	/**
	 * Ebook 허가후 대여요청 목록에서 지우는 메소드
	 * @param vo
	 */
	public void deleteEbookPermit(ManageEbookReqListVO vo);
	/**
	 * 계약 연장후 연장요청 목록에서 지우는 메소드
	 * @param vo
	 */
	public void deleteExtendOrgan(ManageEbookExtendReqListVO vo);
	
	
	/**
	 * 전체 기업 수를 불러오는 메소드
	 * @return int
	 */
	public int getAllOrganListCount();
}
