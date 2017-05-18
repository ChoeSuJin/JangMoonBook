package com.kosta.customer.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.customer.model.BookDAO;

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
}
