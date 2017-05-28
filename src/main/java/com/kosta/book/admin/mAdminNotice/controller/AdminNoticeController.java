package com.kosta.book.admin.mAdminNotice.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.mAdminNotice.model.AdminNoticeDAO;
import com.kosta.book.admin.mAdminNotice.model.AdminNoticeVO;

@Controller
public class AdminNoticeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("mAdminNotice.do")
	public ModelAndView AdminNotice() {
		ModelAndView mav = new ModelAndView();
		
		AdminNoticeDAO dao = sqlSession.getMapper(AdminNoticeDAO.class);
		
		List list = dao.getAdminNotice();
		
		
		mav.setViewName("/admin/manage/mAdminNotice");
		
		mav.addObject("list", list);
		
		return mav;
		
	}
	
	@RequestMapping("regAdminNotice.do")
	public String RegAdminNotice(AdminNoticeVO vo) {
		
		AdminNoticeDAO dao = sqlSession.getMapper(AdminNoticeDAO.class);
		
		System.out.println(vo.getWriter());
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());
		
		dao.regAdminNotice(vo);
		
		
		return "redirect:mAdminNotice.do";
		
	}
	
	@RequestMapping("deleteAdminNotice.do")
	public String DeleteAdminNotice(int num) {
		
		AdminNoticeDAO dao = sqlSession.getMapper(AdminNoticeDAO.class);
		AdminNoticeVO vo = new AdminNoticeVO();
		vo.setNum(num);
		
		
		return "redirecd:mAdminNotice.do";
	}

}
