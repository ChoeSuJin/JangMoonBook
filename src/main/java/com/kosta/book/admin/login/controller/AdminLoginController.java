package com.kosta.book.admin.login.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.book.admin.login.model.EmployeeDAO;
import com.kosta.book.admin.login.model.EmployeeVO;
import com.kosta.book.admin.mAdminNotice.model.AdminNoticeDAO;
import com.kosta.book.admin.mAdminNotice.model.AdminNoticeVO;

@Controller
public class AdminLoginController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/adminLoginForm.do")
	public String loginForm(HttpSession session) {
		
		System.out.println("go loginForm");
		
		if (session.getAttribute("user") == null) {
			return "/admin/adminLogin";
		} else {
			return "redirect:adminMain.do";
		}
		
	}
	
	@RequestMapping("/adminMain.do")
	public String mainForm(Principal principal, HttpServletRequest request) {

		String username = principal.getName();
		System.out.println("username =" + username);
		
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		EmployeeVO vo = dao.loginEmployee(Integer.parseInt(username));
		
		HttpSession session = request.getSession();
		
		AdminNoticeDAO dao2 = sqlSession.getMapper(AdminNoticeDAO.class);
		List<AdminNoticeVO> list = dao2.getAdminNotice();
		
		if (session.getAttribute("isInitLogin") == null) {
			session.setAttribute("isInitLogin", 0);
		}
		
		String branch = vo.getBranch();
		
		int todayAdminNotice = dao2.getTodayNotice();
		int notDoQnA = dao.getCountNotDoQnA();
		int emergencyBook = dao.getCountEmergencyBook(branch);
		int directBook = dao.getCountDirectBook(branch);
		int requestEbook = dao.getCountRequestEbook();
		
		session.setAttribute("name", vo.getName()); //�α����� ȸ���� �̸�
		session.setAttribute("user", vo);
		String main = "main";
		request.setAttribute("main", main);
		request.setAttribute("adminNotice", list);
		request.setAttribute("todayNotice", todayAdminNotice);
		request.setAttribute("notDoQnA", notDoQnA);
		request.setAttribute("emergencyBook", emergencyBook);
		request.setAttribute("directBook", directBook);
		request.setAttribute("requestEbook", requestEbook);
		
		return "/admin/adminMain";
	}
	
	@RequestMapping("/adminLoginError.do")
	public String loginError(HttpServletRequest request){
		String error = "error";
		request.setAttribute("error", error);
		return "/admin/adminLogin";
	}
	
	@ResponseBody
	@RequestMapping("/getMessage.do")
	public HashMap<String, Object> getMessageRealTime(@RequestParam Map<String, String> map) {
	
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		int empNo = Integer.parseInt(map.get("empNo"));
		
		System.out.println(empNo);
		EmployeeDAO dao = sqlSession.getMapper(EmployeeDAO.class);
		
		List list = dao.getCountNotReadMessage(empNo);
		
		data.put("count", list.size());
		data.put("list", list);
		
		return data;
	}
}
