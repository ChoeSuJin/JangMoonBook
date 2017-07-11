package com.kosta.book.customer.board.model;

public interface ReplyDAO {
   
	/**
	 * ����� �ҷ����� �޼ҵ�
	 * @param bno
	 * @return ReplyVO
	 * @throws Exception
	 */
	public ReplyVO view(int bno) throws Exception;
	/**
	 * ����� �ٴ� �޼ҵ�
	 * @param vo
	 */
    public void create(ReplyVO vo);
    /**
     * ��� ���� �޼ҵ�
     * @param vo
     */
    public void update(ReplyVO vo);
    /**
     * ����� �����ϴ� �޼ҵ�
     * @param rno
     */
    public void delete(int rno);
}
 