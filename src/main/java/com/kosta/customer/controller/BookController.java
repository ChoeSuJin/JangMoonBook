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
		model.addAttribute("list", bookDAO.bookSearchDao(vo));
		return "bookList/bookList";
	}	
	
	@RequestMapping("/bookWrite")
	public String write(BookVO vo) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		bookDAO.bookWrite(vo);
		return "redirect:../book/";
	}
	
	@RequestMapping("/bookTypeSearch")
	public String typeList(Model model, BookVO vo) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		System.out.println("책 제목 - " + vo.getTitle());
		System.out.println("책 타입 - " + vo.getType());
		if (vo.getType().equals("all")) {
			model.addAttribute("list", bookDAO.bookNoTypeSearchDao(vo));
			System.out.println("all로 검색");
		}else{
			model.addAttribute("list", bookDAO.bookTypeSearchDao(vo));
			System.out.println("타입 검색");
		}
		return "bookList/bookList";
	}
	@RequestMapping("/bookDetail")
	public String bookDetail(Model model, BookVO vo) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		model.addAttribute("list", bookDAO.bookOneSearchDao(vo));
		return "bookList/bookDetail";
	}
}
