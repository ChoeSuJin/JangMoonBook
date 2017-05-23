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
		
		@RequestMapping("/list")
		public String list(Model model) {
			NoticeDAO customerDAO = sqlSession.getMapper(NoticeDAO.class);
			model.addAttribute("list", customerDAO.listDao());
			return "/list";
		}
		
		@RequestMapping("/view")
		public String view(NoticeVO vo, Model model) {
			NoticeDAO customerDAO = sqlSession.getMapper(NoticeDAO.class);
			model.addAttribute("list", customerDAO.viewDao(vo));
			return "/list";
		}
		
		@RequestMapping("/writeForm")
		public String writeForm() {
			return "/writeForm";
		}
		
		@RequestMapping("/viewForm")
		public String viewForm() {
			return "/viewForm";
		}
		
		@RequestMapping("/mainPage")
		public String mainForm() {
			return "/mainPage";
		}
		
		@RequestMapping("/write")
		public String write(NoticeVO vo, Model model) {
			NoticeDAO customerDAO = sqlSession.getMapper(NoticeDAO.class);
			customerDAO.writeDao(vo);
			return "redirect:list";
		}
		
		
		@RequestMapping("/delete")
		public String delete(NoticeVO vo, Model model) {
			NoticeDAO customerDAO = sqlSession.getMapper(NoticeDAO.class);
			customerDAO.deleteDao(vo);
			return "redirect:list";
		}
		
		@RequestMapping("/content")
		public String content(NoticeVO vo, Model model) {
			NoticeDAO customerDAO = sqlSession.getMapper(NoticeDAO.class);
			model.addAttribute("contentView", customerDAO.viewDao(vo));
			return "content";
		}
}
