package com.kosta.board.model;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
 
@Repository
public class ReplyDAOImpl implements ReplyDAO {
  
	@Inject
    SqlSession sqlSession;
    


    @Override
    public void create(ReplyVO vo) {
        sqlSession.insert("reply.insertReply", vo);
    }
   

	@Override
	public ReplyVO view(int bno) throws Exception {
	
		return sqlSession.selectOne("reply.viewReply", bno);
	}
 
    
    @Override
    public void update(ReplyVO vo) {
       sqlSession.update("reply.update", vo);
 
    }
   
    @Override
    public void delete(int rno) {
        sqlSession.delete("reply.delete", rno);
 
    }



}







