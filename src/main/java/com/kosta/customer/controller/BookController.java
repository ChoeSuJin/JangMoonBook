package com.kosta.customer.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.customer.model.BookDAO;
import com.kosta.customer.model.NoticeDAO;

@Controller
public class BookController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/bookSearch")
	public String list(Model model, HttpServletRequest request) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		model.addAttribute("list", bookDAO.bookSearchDao(request.getParameter("type"),request.getParameter("title"),request.getParameter("category")));
		return "/bookList";
	}	
	
	@RequestMapping("/bookWrite")
	public String write(HttpServletRequest request, Model model) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		bookDAO.bookWrite(
				request.getParameter("title"),
				Integer.parseInt(request.getParameter("price")),
				request.getParameter("author"),
				request.getParameter("publisher"),
				request.getParameter("type"),
				request.getParameter("isbn"),
				request.getParameter("category"));
		return "redirect:../book/";
	}
}
