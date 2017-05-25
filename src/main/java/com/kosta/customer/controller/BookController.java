package com.kosta.customer.controller;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.customer.model.BookDAO;
import com.kosta.customer.model.BookVO;
import com.kosta.customer.model.UsedBookDAO;

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
		String link = "bookList/bookList";
		if (vo.getType().equals("all")) {
			model.addAttribute("list", bookDAO.bookNoTypeSearchDao(vo));
		}else if(vo.getType().equals("usedSelect")){
			link = "registerForUsedBooks/usedSelect";
			model.addAttribute("list", bookDAO.usedSelectDao(vo));
		}else{
			model.addAttribute("list", bookDAO.bookTypeSearchDao(vo));
		}
		System.out.println("가는 경로 - " + link);
		return link;
	}
	
	@RequestMapping("/bookDetail")
	public String bookDetail(Model model, BookVO vo) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		model.addAttribute("list", bookDAO.bookOneSearchDao(vo));
		return "bookList/bookDetail";
	}
	@RequestMapping("/usedSelect")
	public String usedSelect(Model model, BookVO vo) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		model.addAttribute("list", bookDAO.bookNoTypeSearchDao(vo));
		return "registerForUsedBooks/usedSelect";
	}
	
	@RequestMapping("/usedBookWrite")
	public String usedBookWrite(Model model, BookVO vo) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		model.addAttribute("book", bookDAO.bookOneSearchDao(vo));
		return "registerForUsedBooks/usedWrite";
	}
	@RequestMapping("/usedWrite")
	public String usedWrite(Model model, BookVO vo) {
		UsedBookDAO usedBookDAO = sqlSession.getMapper(UsedBookDAO.class);
		usedBookDAO.writeDao(vo);
		return "redirect:../book/";
	}
}
