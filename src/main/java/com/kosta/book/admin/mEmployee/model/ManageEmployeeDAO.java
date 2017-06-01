package com.kosta.book.admin.mEmployee.model;

import java.util.List;
import com.kosta.book.admin.mEmployee.model.ManageEmployeeVO;

public interface ManageEmployeeDAO {
	public List<ManageEmployeeVO> selectAll(String branch);
	public List<ManageEmployeeVO> selectByname(ManageEmployeeVO vo);
	public void update(ManageEmployeeVO vo);
	public void insert(ManageEmployeeVO vo);
	public void delete(ManageEmployeeVO vo);
}
