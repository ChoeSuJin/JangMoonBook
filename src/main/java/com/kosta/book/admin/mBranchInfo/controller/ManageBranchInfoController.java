package com.kosta.book.admin.mBranchInfo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.login.model.EmployeeVO;
import com.kosta.book.admin.mBranchInfo.model.ManageBranchInfoDAO;
import com.kosta.book.admin.mBranchInfo.model.ManageBranchInfoVO;

@Controller
public class ManageBranchInfoController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/mBranchInfo.do")
	public ModelAndView mBranchInfo(HttpServletRequest request){
		ModelAndView mav= new ModelAndView();
		ManageBranchInfoDAO dao = sqlSession.getMapper(ManageBranchInfoDAO.class);
		ManageBranchInfoVO vo = new ManageBranchInfoVO();
		
		// String name = request.getParameter("branch");
		HttpSession session = request.getSession();
		
		EmployeeVO user = (EmployeeVO) session.getAttribute("user");
		String name = user.getBranch();
		System.out.println("지점명 : " + name);
		
		List<ManageBranchInfoVO> list = dao.select(name); 
		int empCount = dao.selectEmpCount(name);		  

		mav.addObject("empCount", empCount);
		mav.addObject("branchInfo", list);
		mav.setViewName("/admin/mBranchInfo");
		System.out.println("뷰 이름 : " + mav.getViewName());
		
		return mav;
	}
	
	@RequestMapping("/mBranchInfoUpdate.do")
	public ModelAndView mBranchInfo(ManageBranchInfoVO vo){
		
		System.out.println("name : " + vo.getName());
		
		ModelAndView mav= new ModelAndView();
		ManageBranchInfoDAO dao = sqlSession.getMapper(ManageBranchInfoDAO.class);
		dao.update(vo);
		
		mav.setViewName("redirect:mBranchInfo.do");
		System.out.println("뷰 이름 : " + mav.getViewName());
		
		return mav;
	}
}
