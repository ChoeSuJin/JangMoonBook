package com.kosta.book.admin.mSales.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.login.model.EmployeeVO;
import com.kosta.book.admin.mSales.model.SalesDAO;
import com.kosta.book.admin.mSales.model.SalesListVO;

@Controller
public class mSalesController {
	
	@Autowired
	SqlSession sqlSession;
	
	
	@RequestMapping("salesMain.do")
	public ModelAndView salesMainForm(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("salesMain.do");
		
		SalesListVO vo = new SalesListVO();
		
		HttpSession session = request.getSession();
		
		EmployeeVO user = (EmployeeVO) session.getAttribute("user");
		
		
		vo.setBranchName(user.getBranch());
		System.out.println("user = " + user.getBranch());
		
		
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		List list1 = dao.saleNewBook(vo);
		List list2 = dao.saleUsedBook(vo);
		int sumNew = dao.sumSaleNewBook(vo);
		int sumUsed = dao.sumSaleUsedBook(vo);
		
		System.out.println("sumNew = " + sumNew);
		
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("sumNew", sumNew);
		mav.addObject("sumUsed", sumUsed);
	
		
		mav.setViewName("/admin/manage/SalesMain");
		return mav;
	}
}
