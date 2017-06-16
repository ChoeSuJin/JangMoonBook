package com.kosta.book.admin.mBranchInfo.model;

import java.util.List;

public interface ManageBranchInfoDAO {
	/**
	 * 지점정보를 가져오는 메소드
	 * @param name
	 * @return List<ManageBranchInfoVO>
	 */
	public List<ManageBranchInfoVO> select(String name);
	/**
	 * 지점에서 일하는 인원을 불러오는 메소드
	 * @param name
	 * @return int
	 */
	public int selectEmpCount(String name);
	/**
	 * 지점정보를 수정하는 메소드
	 * @param vo
	 */
	public void update(ManageBranchInfoVO vo);
}
