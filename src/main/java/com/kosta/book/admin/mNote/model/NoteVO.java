package com.kosta.book.admin.mNote.model;

import java.util.Date;

public class NoteVO {
	
	private int noteNo;
	private String recv_id, sent_id, title, content, recv_read, recv_del, sent_del;
	private Date date_sent, date_read;
	public int getNoteNo() {
		return noteNo;
	}
	public void setNoteNo(int noteNo) {
		this.noteNo = noteNo;
	}
	public String getRecv_id() {
		return recv_id;
	}
	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}
	public String getSent_id() {
		return sent_id;
	}
	public void setSent_id(String sent_id) {
		this.sent_id = sent_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRecv_read() {
		return recv_read;
	}
	public void setRecv_read(String recv_read) {
		this.recv_read = recv_read;
	}
	public String getRecv_del() {
		return recv_del;
	}
	public void setRecv_del(String recv_del) {
		this.recv_del = recv_del;
	}
	public String getSent_del() {
		return sent_del;
	}
	public void setSent_del(String sent_del) {
		this.sent_del = sent_del;
	}
	public Date getDate_sent() {
		return date_sent;
	}
	public void setDate_sent(Date date_sent) {
		this.date_sent = date_sent;
	}
	public Date getDate_read() {
		return date_read;
	}
	public void setDate_read(Date date_read) {
		this.date_read = date_read;
	}
	
	

}
