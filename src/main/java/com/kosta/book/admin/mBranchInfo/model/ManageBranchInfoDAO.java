package com.kosta.book.admin.mBranchInfo.model;

import java.util.List;

public interface ManageBranchInfoDAO {
	/**
	 * ���������� �������� �޼ҵ�
	 * @param name
	 * @return List<ManageBranchInfoVO>
	 */
	public List<ManageBranchInfoVO> select(String name);
	/**
	 * �������� ���ϴ� �ο��� �ҷ����� �޼ҵ�
	 * @param name
	 * @return int
	 */
	public int selectEmpCount(String name);
	/**
	 * ���������� �����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void update(ManageBranchInfoVO vo);
}
