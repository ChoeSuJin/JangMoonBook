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
	public ModelAndView mEmployeeSelect(ManageEmployeeVO vo){
		ModelAndView mav= new ModelAndView();
		ManageEmployeeDAO dao = sqlSession.getMapper(ManageEmployeeDAO.class);
		List<ManageEmployeeVO> list = null;
		System.out.println(vo.getName());
		
		if(vo.getName()!=null){
			list = dao.selectByname(vo);
		}else{
			list = dao.selectAll();
		}
		
		mav.addObject("employeeList", list);
		mav.setViewName("mEmployee");
		System.out.println("viewName : " + mav.getViewName());
		return mav;
	}
	
	@RequestMapping("/mEmployeeUD.html")
	public ModelAndView mEmployeeDel(ManageEmployeeVO vo){
		ModelAndView mav= new ModelAndView();
		ManageEmployeeDAO dao = sqlSession.getMapper(ManageEmployeeDAO.class);
		System.out.println("넘어온 이름 : " + vo.getName());
		if(vo.getPwd()!=null){
			dao.update(vo);
		}else{
			dao.delete(vo);
		}
		
		List<ManageEmployeeVO> list = dao.selectAll();
		mav.addObject("employeeList", list);
		mav.setViewName("mEmployee");
		System.out.println("viewName : " + mav.getViewName());
		return mav;
	}
	
	@RequestMapping("/mEmployeeIn.html")
	public ModelAndView mEmployeeIn(ManageEmployeeVO vo){
		ModelAndView mav= new ModelAndView();
		ManageEmployeeDAO dao = sqlSession.getMapper(ManageEmployeeDAO.class);
		
		dao.insert(vo);
		
		List<ManageEmployeeVO> list = dao.selectAll();
		mav.addObject("employeeList", list);
		mav.setViewName("mEmployee");
		System.out.println("viewName : " + mav.getViewName());
		return mav;
	}
	
}
