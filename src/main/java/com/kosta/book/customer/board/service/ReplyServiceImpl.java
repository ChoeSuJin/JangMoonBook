package com.kosta.book.customer.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.book.customer.board.model.ReplyDAO;
import com.kosta.book.customer.board.model.ReplyVO;
 
@Service
public class ReplyServiceImpl implements ReplyService {
    
    @Inject
    ReplyDAO replyDao;
    

    @Override
    public void create(ReplyVO vo) {
        replyDao.create(vo);
    }
   
    @Override
    public void update(ReplyVO vo) {
       replyDao.update(vo);
 
    }

    @Override
    public void delete(int rno) {
        replyDao.delete(rno);
 
    }

	@Override
	public ReplyVO view(int bno) throws Exception {
		
		return replyDao.view(bno);
	}
 
}
 
