package com.kosta.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kosta.board.model.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> list(
Integer bno,int start, int end, HttpSession session );
	public int count(int bno);
	public void create(ReplyVO vo);
	public void update(ReplyVO vo);
	public void delete(Integer rno);
	public ReplyVO detail(int rno);
}
