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
import com.kosta.book.admin.mBranchInfo.model.ManageBranchInfoDAO;
import com.kosta.book.admin.mBranchInfo.model.ManageBranchInfoVO;
import com.kosta.book.admin.mInventory.model.OrderListVO;
import com.kosta.customer.model.BookVO;

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
		ManageBranchInfoDAO BranchDAO = sqlSession.getMapper(ManageBranchInfoDAO.class);
		EmployeeVO vo = dao.loginEmployee(Integer.parseInt(username));
		String branch = vo.getBranch();
		
		HttpSession session = request.getSession();
		
		AdminNoticeDAO dao2 = sqlSession.getMapper(AdminNoticeDAO.class);
		List<AdminNoticeVO> list = dao2.getAdminNotice();
		List<ManageBranchInfoVO> BranchVO = BranchDAO.select(branch); 
		List<BookVO> newBook = dao.newBook(); 
		List<OrderListVO> latestOrder = dao.latestOrder(branch); 
		
		if (session.getAttribute("isInitLogin") == null) {
			session.setAttribute("isInitLogin", 0);
		}
		
		int todayAdminNotice = dao2.getTodayNotice();
		int notDoQnA = dao.getCountNotDoQnA();
		int emergencyBook = dao.getCountEmergencyBook(branch);
		int directBook = dao.getCountDirectBook(branch);
		int inventory = dao.getInventory(branch);
		int requestEbook = dao.getCountRequestEbook();
		
		session.setAttribute("name", vo.getName());
		session.setAttribute("user", vo);
		String main = "main";
		request.setAttribute("main", main);
		request.setAttribute("adminNotice", list);
		request.setAttribute("todayNotice", todayAdminNotice);
		request.setAttribute("notDoQnA", notDoQnA);
		request.setAttribute("emergencyBook", emergencyBook);
		request.setAttribute("directBook", directBook);
		request.setAttribute("requestEbook", requestEbook);
		request.setAttribute("branch", BranchVO);
		request.setAttribute("inventory", inventory);
		request.setAttribute("newBook", newBook);
		request.setAttribute("latestOrder", latestOrder);
		
		return "/admin/adminMain";
	}

	@RequestMapping("/adminLoginError.do")
	public String loginError(HttpServletRequest request){
		String error = "error";
		request.setAttribute("error", error);
		return "/admin/adminLogin";
	}
}
