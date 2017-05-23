package com.kosta.book.organ.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.mInventory.model.BookInfoVO;
import com.kosta.book.organ.login.model.OrganLoginDAO;
import com.kosta.book.organ.login.model.OrganLoginVO;

@Controller
public class OrganLoginController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/organLoginForm.do")
	public String loginForm() {
		System.out.println("�� �̸� : organLogin");
		
		return "/organization/organLogin";
	}
	
	@RequestMapping("/organLogin.do")
	public ModelAndView main(OrganLoginVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		OrganLoginDAO dao = sqlSession.getMapper(OrganLoginDAO.class);
		OrganLoginVO organ = null; // organ -> ��������
		
		try {			
			organ = dao.loginOrgan(vo);	//�������� ��������
			System.out.println(organ.getOname());
		} catch (Exception e) {			//�������� ������(�α��� ���̵�x) �α��� ��������
			mav.addObject("error", "error");
			mav.setViewName("/organization/organLogin");
			return mav;
		}
		List<BookInfoVO> ebookList = dao.ebookList();
		
		HttpSession session = request.getSession();
		session.setAttribute("organ", organ);
		mav.addObject("ebookList", ebookList);
		
		mav.setViewName("/organization/organReqForm");
		System.out.println("�� �̸� : " + mav.getViewName());
		
		return mav;
	}
	
}
