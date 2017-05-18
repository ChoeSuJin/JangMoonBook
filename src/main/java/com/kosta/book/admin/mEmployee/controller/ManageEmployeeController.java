package com.kosta.book.admin.mEmployee.controller;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.kosta.book.admin.mEmployee.model.ManageEmployeeDAO;
import com.kosta.book.admin.mEmployee.model.ManageEmployeeVO;

@Controller
public class ManageEmployeeController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/mEmployee.html")
	public ModelAndView mBranchInfo(){
		ModelAndView mav= new ModelAndView();
		ManageEmployeeDAO dao = sqlSession.getMapper(ManageEmployeeDAO.class);
		List<ManageEmployeeVO> list = dao.selectAll();
		
		mav.addObject("employeeList", list);
		mav.setViewName("mEmployee");
		System.out.println("viewName : " + mav.getViewName());
		return mav;
	}
	
}
