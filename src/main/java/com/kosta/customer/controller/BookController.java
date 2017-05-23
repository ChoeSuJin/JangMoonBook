package com.kosta.customer.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.customer.model.BookDAO;
import com.kosta.customer.model.BookVO;
import com.kosta.customer.model.NoticeDAO;

@Controller
public class BookController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/bookSearch")
	public String list(Model model, BookVO vo) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		System.out.println(vo.getType());
		System.out.println(vo.getCategory());
		model.addAttribute("list", bookDAO.bookSearchDao(vo));
		return "bookList/bookList";
	}	
	
	@RequestMapping("/bookWrite")
	public String write(BookVO vo) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		bookDAO.bookWrite(vo);
		return "redirect:../book/";
	}
	
	@RequestMapping("/bookDetail")
	public String bookDetail(BookVO vo, Model model) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		model.addAttribute("list", bookDAO.bookOneSearchDao(vo));
		return "bookList/bookDetail";
	}
}
