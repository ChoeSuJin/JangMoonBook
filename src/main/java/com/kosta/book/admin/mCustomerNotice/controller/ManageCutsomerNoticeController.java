package com.kosta.book.admin.mCustomerNotice.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.mCustomerNotice.model.CustomerNoticeDAO;
import com.kosta.book.admin.mCustomerNotice.model.CustomerNoticeVO;

@Controller
public class ManageCutsomerNoticeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("mCustomerNotice.do")
	public ModelAndView CustomerNotice() {
		
		ModelAndView mav = new ModelAndView();
		
		CustomerNoticeDAO dao = sqlSession.getMapper(CustomerNoticeDAO.class);
		
		List<CustomerNoticeVO> list = dao.getList();
		
		mav.addObject("list", list);
		
		mav.setViewName("/admin/mCustomerNotice");
		return mav;
		
	}
	
	@RequestMapping("mWriteCustomerNotice.do")
	public String writeCustomerNoticeForm() {
		
		return "/admin/mWriteCustomerNotice";
	}
	
	@RequestMapping("regCustomerNotice.do")
	public String RegCustomerNotice(CustomerNoticeVO vo) {
		
		CustomerNoticeDAO dao = sqlSession.getMapper(CustomerNoticeDAO.class);
		
		dao.regNotice(vo);
		
		return "redirect:mCustomerNotice.do";
		
	}
	

}
