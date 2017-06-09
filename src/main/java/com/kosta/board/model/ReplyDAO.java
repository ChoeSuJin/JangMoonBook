package com.kosta.board.model;

public interface ReplyDAO {
   
	public ReplyVO view(int bno) throws Exception;
    public void create(ReplyVO vo);
    public void update(ReplyVO vo);
    public void delete(int rno);
}
 