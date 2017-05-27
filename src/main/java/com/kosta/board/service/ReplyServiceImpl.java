package com.kosta.board.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kosta.board.model.ReplyDAO;
import com.kosta.board.model.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO replyDao;

	@Override
	public List<ReplyVO> list(Integer bno, int start, int end, HttpSession session) {
		List<ReplyVO> items = replyDao.list(bno, start, end);
		// 현재 사용자
	String id = (String) session.getAttribute("id");
	for (ReplyVO vo : items) {
		if(vo.getSecret_reply().equals("y")) {
			if (id == null){ 
				vo.setReplytext("비밀댓글입니다.");
			}else{ 
				String writer = vo.getWriter();
				String replyer = vo.getReplyer();
				if (!id.equals(writer) 
						&& !id.equals(replyer)) {
					vo.setReplytext("비밀댓글입니다.");
				}
			}
		}
	}
		return items;
	}

	@Override
	public void create(ReplyVO vo) {
		replyDao.create(vo);
	}

	@Override
	public void update(ReplyVO vo) {
		replyDao.update(vo);
	}

	@Override
	public void delete(Integer rno) {
		replyDao.delete(rno); 
	}

	@Override
	public int count(int bno) {
		return replyDao.count(bno);
	}

	@Override
	public ReplyVO detail(int rno) {
		return replyDao.detail(rno);
	}

}
