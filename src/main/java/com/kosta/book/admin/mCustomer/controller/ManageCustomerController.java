package com.kosta.book.admin.mCustomer.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.mCustomer.model.ManageCustomerDAO;
import com.kosta.book.admin.mCustomer.model.ManageCustomerVO;

@Controller
public class ManageCustomerController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/mCustomer.do")
	public ModelAndView mCustomer(){
		ModelAndView mav= new ModelAndView();
		
		ManageCustomerDAO dao = sqlSession.getMapper(ManageCustomerDAO.class);
 		List<ManageCustomerVO> list = dao.selectAll();
 		
		mav.addObject("customerList", list);
		mav.addObject("count", list.size() );
		mav.setViewName("mCustomer");
		System.out.println("ºä ³×ÀÓ : " + mav.getViewName());
		
		return mav;
	}
	
}
