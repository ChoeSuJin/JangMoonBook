package com.kosta.book.admin.mQnABoard.model;

import java.util.List;

public interface ManageQnABoardDAO {
	
	public List<QnABoardVO> getList();
	public QnABoardVO viewBoard(QnABoardVO vo);
	public void regReply(QnAReplyVO vo);

}
