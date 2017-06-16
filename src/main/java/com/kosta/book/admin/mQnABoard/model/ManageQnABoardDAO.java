package com.kosta.book.admin.mQnABoard.model;

import java.util.List;

public interface ManageQnABoardDAO {
	
	/**
	 * QnA리스트를 가져오는 메소드
	 * @return List<QnABoardVO>
	 */
	public List<QnABoardVO> getList();
	/**
	 * QnA글 내용을 불러오는 메소드
	 * @param vo
	 * @return QnABoardVO
	 */
	public QnABoardVO viewBoard(QnABoardVO vo);
	/**
	 * 답글을 등록하는 메소드
	 * @param vo
	 */
	public void regReply(QnAReplyVO vo);

}
