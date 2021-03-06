package com.kosta.book.customer.board.model;
import java.util.Date;

public class ReplyVO {
    private Integer rno;        // ?κΈ? λ²νΈ
    private Integer bno;        // κ²μκΈ? λ²νΈ
    private String replytext;    // ?κΈ? ?΄?©
    private String replyer;        // ?κΈ? ??±?
    private String userName;    // ?κΈ? ??±?? ?΄λ¦?(??? ?΄λ¦?)
    private Date regdate;        // ?κΈ? ??±?Ό?
    private Date updatedate;    // ?κΈ? ?? ?Ό?
    
    // Getter/Setter
    public Integer getRno() {
        return rno;
    }
    public void setRno(Integer rno) {
        this.rno = rno;
    }
    public Integer getBno() {
        return bno;
    }
    public void setBno(Integer bno) {
        this.bno = bno;
    }
    public String getReplytext() {
        return replytext;
    }
    public void setReplytext(String replytext) {
        this.replytext = replytext;
    }
    public String getReplyer() {
        return replyer;
    }
    public void setReplyer(String replyer) {
        this.replyer = replyer;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public Date getRegdate() {
        return regdate;
    }
    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
    public Date getUpdatedate() {
        return updatedate;
    }
    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
    }
    
    // toString()
    @Override
    public String toString() {
        return "ReplyVO [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer
                + ", userName=" + userName + ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
    }
    
    
}
 
