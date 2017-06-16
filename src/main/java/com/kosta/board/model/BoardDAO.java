package com.kosta.board.model;

import java.util.List;

public interface BoardDAO {
	
	/**
	 * 
	 * QnA�� ��� method
	 * 
	 * @param vo 
	 * @throws Exception
	 * 
	 */
	public void create(BoardVO vo) throws Exception;
	
	/**
	 * 
	 * QnA������ �ҷ����� �޼ҵ�
	 * 
	 * @param bno
	 * @return BoardVO
	 * @throws Exception
	 */
	public BoardVO read(int bno) throws Exception;
	/**
	 * QnA�� �����ϴ� �޼ҵ�
	 * @param vo
	 * @throws Exception
	 */
	public void update(BoardVO vo) throws Exception;
	/**
	 * QnA�� �����ϴ� �޼ҵ�
	 * @param bno
	 * @throws Exception
	 */
	public void delete(int bno) throws Exception;
	/**
	 * �۸���� �������� �޼ҵ�
	 * @param start
	 * @param end
	 * @param searchOption
	 * @param keyword
	 * @return List<BoardVO>
	 * @throws Exception
	 */
	public List<BoardVO> listAll(int start, int end,String searchOption,String keyword) throws Exception;
	/**
	 * ��ȸ���� ������Ű�� �޼ҵ�
	 * @param bno
	 * @throws Exception
	 */
	public void increaseViewcnt(int bno) throws Exception;
	
	/**
	 * ��ϵ� ���� ������ �о���� �޼ҵ�
	 * @param searchOption
	 * @param keyword
	 * @return int
	 * @throws Exception
	 */
	public int countArticle(String searchOption,String keyword)	throws Exception;
}
