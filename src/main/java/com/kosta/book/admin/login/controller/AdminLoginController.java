package com.kosta.book.admin.login.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kosta.book.admin.login.model.EmployeeDAO;
import com.kosta.book.admin.login.model.EmployeeVO;
import com.kosta.book.admin.mAdminNotice.model.AdminNoticeDAO;
import com.kosta.book.admin.mAdminNotice.model.AdminNoticeVO;

@Controller
public class AdminLoginController {
	
	@Autowired
	SqlSession sqlSession;
	//�α��� ��
	@RequestMapping("/adminLoginForm.do")
	public String loginForm() {
		System.out.println("go loginForm");
		
		return "/admin/adminLogin";
	}
	//�α��� ����
	@RequestMapping("/adminNav.do")
	public String mainForm(Principal principal, HttpServletRequest request) {

		String username = principal.getName();
		System.out.println("username =" + username);
		
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		EmployeeVO vo = dao.loginEmployee(Integer.parseInt(username));
		
		HttpSession session = request.getSession();
		
		AdminNoticeDAO dao2 = sqlSession.getMapper(AdminNoticeDAO.class);
		List<AdminNoticeVO> list = dao2.getAdminNotice();
		
		
		session.setAttribute("user", vo);
		String main = "main";
		request.setAttribute("main", main);
		request.setAttribute("adminNotice", list);
		return "/admin/adminNav";
	}
	//�α��� ����
	@RequestMapping("/adminLoginError.do")
	public String loginError(HttpServletRequest request){
		String error = "error";
		request.setAttribute("error", error);
		return "/admin/adminLogin";
	}
}
