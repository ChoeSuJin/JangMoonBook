package com.kosta.customer.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.book.HomeController;
import com.kosta.customer.model.NoticeDAO;
import com.kosta.customer.model.NoticeVO;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
		
		@Autowired
		private SqlSession sqlSession;
		
		@RequestMapping("/list")
		public String list(Model model) {
			NoticeDAO customerDAO = sqlSession.getMapper(NoticeDAO.class);
			model.addAttribute("list", customerDAO.listDao());
			return "/list";
		}
		
		@RequestMapping("/view")
		public String view(HttpServletRequest request, Model model) {
			NoticeDAO customerDAO = sqlSession.getMapper(NoticeDAO.class);
			model.addAttribute("list", customerDAO.viewDao(request.getParameter("title")));
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
		public String write(HttpServletRequest request, Model model) {
			NoticeDAO customerDAO = sqlSession.getMapper(NoticeDAO.class);
			customerDAO.writeDao(request.getParameter("title"), request.getParameter("content"));
			return "redirect:list";
		}
		
		
		@RequestMapping("/delete")
		public String delete(HttpServletRequest request, Model model) {
			NoticeDAO customerDAO = sqlSession.getMapper(NoticeDAO.class);
			customerDAO.deleteDao(request.getParameter("title"));
			return "redirect:list";
		}
		
		@RequestMapping("/content")
		public String content(HttpServletRequest request, Model model) {
			NoticeDAO customerDAO = sqlSession.getMapper(NoticeDAO.class);
			model.addAttribute("contentView", customerDAO.viewDao(request.getParameter("title")));
			return "content";
		}
}
