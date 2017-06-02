package com.kosta.book;

import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.customer.model.BookDAO;
import com.kosta.customer.model.NoticeDAO;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	/*@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {				
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		model.addAttribute("noticeList", noticeDAO.noticeList());
		model.addAttribute("bookInfoList", bookDAO.allList());
		return "mainPage";
	}*/
}
