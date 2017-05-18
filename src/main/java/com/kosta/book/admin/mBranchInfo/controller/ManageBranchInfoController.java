package com.kosta.book.admin.mBranchInfo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.mBranchInfo.model.ManageBranchInfoDAO;
import com.kosta.book.admin.mBranchInfo.model.ManageBranchInfoVO;

@Controller
public class ManageBranchInfoController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/mBranchInfo.html")
	public ModelAndView mBranchInfo(HttpServletRequest request){
		ModelAndView mav= new ModelAndView();
		ManageBranchInfoDAO dao = sqlSession.getMapper(ManageBranchInfoDAO.class);

		String name = request.getParameter("branch");
		System.out.println("지점 명 : " + name);
		
		List<ManageBranchInfoVO> list = dao.select(name);
		
		mav.addObject("branchInfo", list);
		mav.setViewName("mBranchInfo");
		System.out.println("뷰 네임 : " + mav.getViewName());
		
		return mav;
	}
	
	@RequestMapping("/mBranchInfoUpdate.html")
	public String mBranchInfo(ManageBranchInfoVO vo){
		ManageBranchInfoDAO dao = sqlSession.getMapper(ManageBranchInfoDAO.class);
		dao.update(vo);
		return "redirect:mBranchInfo.html";
	}
}
