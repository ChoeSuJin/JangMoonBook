package com.kosta.book.admin.mNote.model;

import java.util.List;

public interface NoteDAO {
	
	public void sendNote(NoteVO vo);
	public NoteVO readNote(int noteNo);
	public int getIsRead(int noteNo);
	public void setRead(int noteNo);
	public void deleteSendNote(int noteNo);
	public void deleteRecvNote(int noteNo);
	public List viewSentList(int empNo);
	public List viewRecvList(int empNo);

}
