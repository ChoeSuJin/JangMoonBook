package com.kosta.book.admin.mEmployee.model;

import java.util.List;
import com.kosta.book.admin.mEmployee.model.ManageEmployeeVO;

public interface ManageEmployeeDAO {

	/**
	 * �ش� �������� ���ϴ� ��������� �ҷ����� �޼ҵ�
	 * @param branch
	 * @return List<ManageEmployeeVO>
	 */
	public List<ManageEmployeeVO> selectAll(String branch);
	/**
	 * �������� �̸����� �˻��ϴ� �޼ҵ�
	 * @param vo
	 * @return List<ManageEmployeeVO>
	 */
	public List<ManageEmployeeVO> selectByname(ManageEmployeeVO vo);
	/**
	 * ���������� �����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void update(ManageEmployeeVO vo);
	/**
	 * ������Ͽ��� �����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void delete(ManageEmployeeVO vo);
	/**
	 * �Ƹ�����Ʈ�� ����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void insertBronze(ManageEmployeeVO vo);
	/**
	 * �Ŵ����� ����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void insertGold(ManageEmployeeVO vo);
	/**
	 * �������� ����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void insertPlatinum(ManageEmployeeVO vo);
	/**
	 * ���������� ����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void insertDiamond(ManageEmployeeVO vo);
}
