package com.kosta.book.admin.login.model;

import java.util.List;

import com.kosta.book.admin.mNote.model.NoteVO;

public interface EmployeeDAO {
	
	/**
	 * Admin �α��� �޼ҵ�
	 * @param empNo
	 * @return EmployeeVO
	 */
	public EmployeeVO loginEmployee(int empNo);
	/**
	 * ��ó�� QnA ������ �о���� �޼ҵ�
	 * @return int
	 */
	public int getCountNotDoQnA();
	/**
	 * �԰��� ���� ������ �о���� �޼ҵ�
	 * @param branch
	 * @return int
	 */
	public int getCountEmergencyBook(String branch);
	/**
	 * ���� ���������ϴ� ���� �Ǽ��� �о���� �޼ҵ�
	 * @param branch
	 * @return int
	 */
	public int getCountDirectBook(String branch);
	/**
	 * Ebook �뿩��û�� �о���� �޼ҵ�
	 * @return int
	 */
	public int getCountRequestEbook();
	
	/**
	 * 읽지않은 메세지 목록을 가져오는 메소드
	 * @param empNo
	 * @return NoteVO
	 */
	public List<NoteVO> getCountNotReadMessage(int empNo);

}
