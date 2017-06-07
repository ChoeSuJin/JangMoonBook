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
	
	
	@RequestMapping("mSales.do")
	public ModelAndView salesMainForm(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("mSales.do");
		
		SalesListVO vo = new SalesListVO();
		
		HttpSession session = request.getSession();
		
		EmployeeVO user = (EmployeeVO) session.getAttribute("user");
		
		
		vo.setBranchName(user.getBranch());
		System.out.println("user = " + user.getBranch());
		
		
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		List<SalesListVO> list1 = dao.saleNewBook(vo);
		List<SalesListVO> list2 = dao.saleUsedBook(vo);
		String sumNew = dao.sumSaleNewBook(vo);
		String sumUsed = dao.sumSaleUsedBook(vo);
		
		// ¾øÀ¸¸é -> 0 
		if(sumNew==null){
			sumNew = "0";
		}else if(sumUsed==null){
			sumUsed = "0";
		}
		
		System.out.println("sumNew = " + sumNew);
		
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("sumNew", sumNew);
		mav.addObject("sumUsed", sumUsed);
	
		
		mav.setViewName("/admin/manage/mSales");
		return mav;
	}
}
