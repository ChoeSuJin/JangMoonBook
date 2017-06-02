package com.kosta.customer.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.customer.model.NoticeDAO;
import com.kosta.customer.model.NoticeVO;

@Controller
public class NoticeController {		
		@Autowired
		private SqlSession sqlSession;
		@RequestMapping("/noticeWirte.do")
		public String noticeWirte(Model model, NoticeVO noticeVO ) {
			NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
			noticeDAO.noticeWrite(noticeVO);
			return "redirect:../book/";
		}
		
		@RequestMapping("/noticeWriteForm.do")
		public String noticeWriteForm(Model model) {
			return "notice/noticeWriteForm";
		}
		
		
		@RequestMapping("/noticeList.do")
		public String noticeList(Model model) {
			NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
			model.addAttribute("noticeList", noticeDAO.noticeList());
			return "notice/noticeList";
		}
		
		@RequestMapping("/detailView.do")
		public String detailsView(Model model, NoticeVO noticeVO) {
			System.out.println(noticeVO.getArticleNumber());
			NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
			model.addAttribute("detailView", noticeDAO.detailView(noticeVO));
			return "notice/noticeDetailView";
		}
}
