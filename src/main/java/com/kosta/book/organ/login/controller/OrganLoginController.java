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
		System.out.println("뷰 이름 : organLogin");
		
		return "/organization/organLogin";
	}
	
	@RequestMapping("/organLogin.do")
	public ModelAndView main(OrganLoginVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		OrganLoginDAO dao = sqlSession.getMapper(OrganLoginDAO.class);
		OrganLoginVO organ = null; // organ -> 조직정보
		
		try {			
			organ = dao.loginOrgan(vo);	//조직정보 가져오기
			System.out.println(organ.getOname());
		} catch (Exception e) {			//조직정보 없을시(로그인 아이디x) 로그인 페이지로
			mav.addObject("error", "error");
			mav.setViewName("/organization/organLogin");
			return mav;
		}
		List<BookInfoVO> ebookList = dao.ebookList();
		
		HttpSession session = request.getSession();
		session.setAttribute("organ", organ);
		mav.addObject("ebookList", ebookList);
		
		mav.setViewName("/organization/organReqForm");
		System.out.println("뷰 이름 : " + mav.getViewName());
		
		return mav;
	}
	
}
