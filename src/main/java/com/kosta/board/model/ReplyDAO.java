package com.kosta.board.model;

import java.util.List;

import com.kosta.board.model.ReplyVO;

//p.372
public interface ReplyDAO {
	public List<ReplyVO> list(Integer bno,int start, int end);
	public int count(int bno);
	public void create(ReplyVO vo);
	public void update(ReplyVO vo);
	public void delete(Integer rno);
	public ReplyVO detail(int rno);
}
