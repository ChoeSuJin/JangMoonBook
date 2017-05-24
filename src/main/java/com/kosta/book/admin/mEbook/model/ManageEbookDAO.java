package com.kosta.book.admin.mEbook.model;

import java.util.List;

public interface ManageEbookDAO {
	
	public List<ManageEbookOrganVO> getEbookOrganList();
	public List<ManageEbookListVO> getEbookList(ManageEbookOrganVO vo);
	public List<ManageEbookReqListVO> getEbookPermitList();
	public List<ManageEbookExtendReqListVO> getEbookExtendReqList();
	
	public void insertNewCompany(ManageEbookOrganVO vo);
	public void insertEbookPermit(ManageEbookListVO vo);
	public void updateExtendOrgan(ManageEbookExtendReqListVO vo);
	
	public void deleteEbookPermit(ManageEbookReqListVO vo);
	public void deleteExtendOrgan(ManageEbookExtendReqListVO vo);
	
	
	
	public int getAllListCount();
}
