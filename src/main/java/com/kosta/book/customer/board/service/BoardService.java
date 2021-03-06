package com.kosta.book.customer.board.service;

import java.util.List;

import com.kosta.book.customer.board.model.BoardVO;

public interface BoardService {
	public void create(BoardVO vo) throws Exception;
	public BoardVO read(int bno) throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void delete(int bno) throws Exception;
	public List<BoardVO> listAll(String searchOption,String keyword) throws Exception;
	public void increaseViewcnt(int bno) throws Exception;
	public int countArticle(String searchOption,String keyword)	throws Exception;
}
