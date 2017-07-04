package com.kosta.book.admin.mEmployee.model;

import java.util.List;
import com.kosta.book.admin.mEmployee.model.ManageEmployeeVO;

public interface ManageEmployeeDAO {

	/**
	 * 해당 지점에서 일하는 직원목록을 불러오는 메소드
	 * @param branch
	 * @return List<ManageEmployeeVO>
	 */
	public List<ManageEmployeeVO> selectAll(String branch);
	/**
	 * 직원들을 이름으로 검색하는 메소드
	 * @param vo
	 * @return List<ManageEmployeeVO>
	 */
	public List<ManageEmployeeVO> selectByname(ManageEmployeeVO vo);
	/**
	 * 직원정보를 수정하는 메소드
	 * @param vo
	 */
	public void update(ManageEmployeeVO vo);
	/**
	 * 직원목록에서 삭제하는 메소드
	 * @param vo
	 */
	public void delete(ManageEmployeeVO vo);
	/**
	 * 아르바이트를 등록하는 메소드
	 * @param vo
	 */
	public void insertBronze(ManageEmployeeVO vo);
	/**
	 * 매니저를 등록하는 메소드
	 * @param vo
	 */
	public void insertGold(ManageEmployeeVO vo);
	/**
	 * 지점장을 등록하는 메소드
	 * @param vo
	 */
	public void insertPlatinum(ManageEmployeeVO vo);
	/**
	 * 본사직원을 등록하는 메소드
	 * @param vo
	 */
	public void insertDiamond(ManageEmployeeVO vo);
}
