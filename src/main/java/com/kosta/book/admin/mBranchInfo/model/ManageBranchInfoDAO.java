package com.kosta.book.admin.mBranchInfo.model;

import java.util.List;

public interface ManageBranchInfoDAO {
	public List<ManageBranchInfoVO> select(String name);
	public int selectEmpCount(String name);
	public void update(ManageBranchInfoVO vo);
}
