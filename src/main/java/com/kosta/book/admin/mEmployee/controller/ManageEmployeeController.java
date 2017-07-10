package com.kosta.book.admin.mEmployee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.login.model.EmployeeVO;
import com.kosta.book.admin.mEmployee.model.ManageEmployeeDAO;
import com.kosta.book.admin.mEmployee.model.ManageEmployeeVO;

@Controller
public class ManageEmployeeController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/mEmployee.do")
	public ModelAndView mEmployee(ManageEmployeeVO vo, HttpServletRequest request){
		ModelAndView mav= new ModelAndView();
		ManageEmployeeDAO dao = sqlSession.getMapper(ManageEmployeeDAO.class);
		List<ManageEmployeeVO> list = null;
		
		HttpSession session = request.getSession();
		EmployeeVO user = (EmployeeVO) session.getAttribute("user");
		String branch = user.getBranch();
		
		if(vo.getName()!=null){	// 넘어온 이름이 있으면 이름으로 검색
			vo.setBranch(branch);
			list = dao.selectByname(vo);
		}else{
			list = dao.selectAll(branch);
		}
		
		mav.addObject("branch", branch);
		mav.addObject("employeeList", list);
		mav.setViewName("/admin/mEmployee");
		System.out.println("viewName : " + mav.getViewName());
		return mav;
	}
	
	@RequestMapping("/mEmployeeUD.do")
	public ModelAndView mEmployeeDel(ManageEmployeeVO vo, HttpServletRequest request){
		ModelAndView mav= new ModelAndView();
		ManageEmployeeDAO dao = sqlSession.getMapper(ManageEmployeeDAO.class);
		
		HttpSession session = request.getSession();
		EmployeeVO user = (EmployeeVO) session.getAttribute("user");
		String branch = user.getBranch();
		
		System.out.println("넘어온 이름 값 : " + vo.getName());
		if(vo.getName()!=null){	// 이름값이 넘어오면 업데이트 아니면 삭제
			dao.update(vo);
		}else{
			dao.delete(vo);
		}
		
		List<ManageEmployeeVO> list = dao.selectAll(branch);
		mav.addObject("employeeList", list);
		mav.setViewName("/admin/mEmployee");
		System.out.println("viewName : " + mav.getViewName());
		return mav;
	}
	
	@RequestMapping("/mEmployeeIn.do")
	public ModelAndView mEmployeeIn(ManageEmployeeVO vo, HttpServletRequest request){
		ModelAndView mav= new ModelAndView();
		ManageEmployeeDAO dao = sqlSession.getMapper(ManageEmployeeDAO.class);
		
		HttpSession session = request.getSession();
		EmployeeVO user = (EmployeeVO) session.getAttribute("user");
		String branch = user.getBranch();
		System.out.println("branch : " + branch);
		vo.setBranch(branch);

		
		if(vo.getName() == null){ 
			mav.addObject("branch", branch);
			mav.setViewName("/admin/mEmployeeIn");
			return mav;
		}
		
		
		String empclass = vo.getEmpclass(); 
		try {
			if(empclass.equalsIgnoreCase("ROLE_BRONZE")){
				dao.insertBronze(vo);	
			}else if(empclass.equalsIgnoreCase("ROLE_GOLD")){
				dao.insertGold(vo);		
			}else if(empclass.equalsIgnoreCase("ROLE_PLATINUM")){
				dao.insertPlatinum(vo);	
			}else if(empclass.equalsIgnoreCase("ROLE_DIAMOND")){
				dao.insertDiamond(vo);	
			}
		} catch (Exception e) {
			mav.addObject("registError", "error");
			mav.setViewName("/admin/mEmployee");
			return mav;
		}
		
		mav.setViewName("redirect:mEmployee.do");
		System.out.println("viewName : " + mav.getViewName());
		return mav;
	}
	
}
