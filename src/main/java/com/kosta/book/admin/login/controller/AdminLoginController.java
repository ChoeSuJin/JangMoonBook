package com.kosta.book.admin.login.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminLoginController {
	
	/*@Autowired
	SqlSession sqlSession;*/
	
	@RequestMapping("/adminLoginForm.do")
	public String loginForm() {
		System.out.println("go loginForm");
		
		return "/admin/adminLogin";
	}
	
	@RequestMapping("/adminMain.do")
	public String mainForm() {
		
		return "/admin/adminMain";
	}
	
	@RequestMapping("/fail.do")
	public String fail() {
		
		return "AdminLoginFail";
	}
	
}
