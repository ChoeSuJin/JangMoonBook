package com.kosta.book;

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

import com.kosta.customer.model.CustomerDAO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
/*
	@Autowired
	private SqlSession sqlSession;*/
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	/*
	@RequestMapping("/list")
	public String list(Model model) {
		System.out.println("리스트 호출됨");
		CustomerDAO customerDAO = sqlSession.getMapper(CustomerDAO.class);
		System.out.println("세션 겟 메펄");
		model.addAttribute("list", customerDAO.listDao());
		System.out.println("DAO 호출했음");
		
		return "/list";
	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		
		return "/writeForm";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		CustomerDAO customerDAO = sqlSession.getMapper(CustomerDAO.class);
		customerDAO.writeDao(request.getParameter("mWriter"), request.getParameter("mContent"));
		return "redirect:list";
	}
	
	@RequestMapping("/view")
	public String view() {
		
		return "/view";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		CustomerDAO customerDAO = sqlSession.getMapper(CustomerDAO.class);
		customerDAO.deleteDao(request.getParameter("mId"));
		return "redirect:list";
	}*/
	
}
