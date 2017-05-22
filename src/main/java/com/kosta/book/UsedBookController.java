package com.kosta.book;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.customer.model.BookVO;
import com.kosta.customer.model.UsedBookDAO;

@Controller
public class UsedBookController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("usedWriteForm")
	public String writeForm() {
		System.out.println("나 여기로 왔어요");
		return "registerForUsedBooks/usedWriteForm";
	}
	/*HttpServletRequest request*/
	@RequestMapping("/usedWrite")
	public String write(BookVO vo, Model model) {
		UsedBookDAO usedBookDAO = sqlSession.getMapper(UsedBookDAO.class);
		usedBookDAO.writeDao(vo);
		return "redirect:../book/";
	}
	
	/*
	 *

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
		public String view(HttpServletRequest request, Model model) {
			NoticeDAO customerDAO = sqlSession.getMapper(NoticeDAO.class);
			model.addAttribute("list", customerDAO.viewDao(request.getParameter("title")));
			return "/list";
		}
		
		@RequestMapping("/writeForm")
		public String writeForm() {
			return "/writeForm";
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

	 * 
	 * */
}
