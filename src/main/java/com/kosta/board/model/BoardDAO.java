package com.kosta.board.model;

import java.util.List;

public interface BoardDAO {
	
	/**
	 * 
	 * QnA글 등록 method
	 * 
	 * @param vo 
	 * @throws Exception
	 * 
	 */
	public void create(BoardVO vo) throws Exception;
	
	/**
	 * 
	 * QnA내용을 불러오는 메소드
	 * 
	 * @param bno
	 * @return BoardVO
	 * @throws Exception
	 */
	public BoardVO read(int bno) throws Exception;
	/**
	 * QnA를 수정하는 메소드
	 * @param vo
	 * @throws Exception
	 */
	public void update(BoardVO vo) throws Exception;
	/**
	 * QnA를 삭제하는 메소드
	 * @param bno
	 * @throws Exception
	 */
	public void delete(int bno) throws Exception;
	/**
	 * 글목록을 가져오는 메소드
	 * @param start
	 * @param end
	 * @param searchOption
	 * @param keyword
	 * @return List<BoardVO>
	 * @throws Exception
	 */
	public List<BoardVO> listAll(int start, int end,String searchOption,String keyword) throws Exception;
	/**
	 * 조회수를 증가시키는 메소드
	 * @param bno
	 * @throws Exception
	 */
	public void increaseViewcnt(int bno) throws Exception;
	
	/**
	 * 등록된 글의 갯수를 읽어오는 메소드
	 * @param searchOption
	 * @param keyword
	 * @return int
	 * @throws Exception
	 */
	public int countArticle(String searchOption,String keyword)	throws Exception;
}
