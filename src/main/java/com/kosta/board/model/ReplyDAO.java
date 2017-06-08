package com.kosta.board.model;

import java.util.List;

import com.kosta.board.model.ReplyVO;
 
public interface ReplyDAO {
   
	public ReplyVO view(int bno) throws Exception;
    public void create(ReplyVO vo);
    public void update(ReplyVO vo);
    public void delete(int rno);
}
 