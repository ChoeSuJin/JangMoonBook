package com.kosta.book.admin.mQnABoard.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.mQnABoard.model.ManageQnABoardDAO;
import com.kosta.book.admin.mQnABoard.model.QnABoardVO;
import com.kosta.book.admin.mQnABoard.model.QnAReplyVO;

@Controller
public class ManageQnABoardController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("mQnAList.do")
	public ModelAndView qnaBoard() {
		
		ModelAndView mav = new ModelAndView();
		
		ManageQnABoardDAO dao = sqlSession.getMapper(ManageQnABoardDAO.class);
		
		List list = dao.getList();
		
		mav.addObject("list", list);
		mav.setViewName("/admin/mQnAList");
		
		return mav;
	}
	
	
	@RequestMapping("detailQnA.do")
	public ModelAndView detailQnA(String bno) {
		
		System.out.println("detailQnA.do");
		ModelAndView mav = new ModelAndView();
		ManageQnABoardDAO dao = sqlSession.getMapper(ManageQnABoardDAO.class);
		
		QnABoardVO vo = new QnABoardVO();
		vo.setBno(Integer.parseInt(bno));
		
		QnABoardVO detail = dao.viewBoard(vo);
		
		
		mav.setViewName("/admin/mQnAReply");
		mav.addObject("list", detail);
		return mav;
	}
	
	@RequestMapping("regReply.do")
	public String regReply(@ModelAttribute QnAReplyVO vo) {
		
		System.out.println("regReply.do");
		
		ManageQnABoardDAO dao = sqlSession.getMapper(ManageQnABoardDAO.class);
		dao.regReply(vo);
		
		
		return "redirect:mQnAList.do";
	}
	
}
