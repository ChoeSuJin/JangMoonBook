package com.kosta.book.customer.board.service;

import java.util.List;

import com.kosta.book.customer.board.model.ReplyVO;
 
public interface ReplyService {
    
	public ReplyVO view(int bno) throws Exception;
	public void create(ReplyVO vo);
    public void update(ReplyVO vo);
    public void delete(int rno);
}