package com.kosta.book.customer.board.model;

public interface ReplyDAO {
   
	/**
	 * 댓글을 불러오는 메소드
	 * @param bno
	 * @return ReplyVO
	 * @throws Exception
	 */
	public ReplyVO view(int bno) throws Exception;
	/**
	 * 댓글을 다는 메소드
	 * @param vo
	 */
    public void create(ReplyVO vo);
    /**
     * 댓글 수정 메소드
     * @param vo
     */
    public void update(ReplyVO vo);
    /**
     * 댓글을 삭제하는 메소드
     * @param rno
     */
    public void delete(int rno);
}
 