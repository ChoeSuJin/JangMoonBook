package com.kosta.book.admin.mQnABoard.model;

import java.util.List;

public interface ManageQnABoardDAO {
	
	/**
	 * QnA����Ʈ�� �������� �޼ҵ�
	 * @return List<QnABoardVO>
	 */
	public List<QnABoardVO> getList();
	/**
	 * QnA�� ������ �ҷ����� �޼ҵ�
	 * @param vo
	 * @return QnABoardVO
	 */
	public QnABoardVO viewBoard(QnABoardVO vo);
	/**
	 * ����� ����ϴ� �޼ҵ�
	 * @param vo
	 */
	public void regReply(QnAReplyVO vo);

}
