package com.kosta.book.organ.mOrgan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.mEbook.model.ManageEbookReqListVO;
import com.kosta.book.admin.mInventory.model.BookInfoVO;
import com.kosta.book.organ.login.model.OrganLoginVO;
import com.kosta.book.organ.mOrgan.model.ManageOrganDAO;
import com.kosta.book.organ.mOrgan.model.ManageOrganVO;

@Controller
public class ManageOrganController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/OrganReqForm.do")
	public ModelAndView oganReqForm() {
		
		ModelAndView mav = new ModelAndView();
		ManageOrganDAO dao = sqlSession.getMapper(ManageOrganDAO.class);
	
		//ebook 목록 뽑기
		List<BookInfoVO> ebookList = dao.ebookList();
		
		mav.addObject("ebookList",ebookList);
		mav.setViewName("/organization/organReqForm");
		System.out.println("뷰 이름 : " + mav.getViewName());
		return mav;
	}
	
	@RequestMapping("/mOrganReq.do")
	public ModelAndView reqEbook(ManageOrganVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ManageOrganDAO dao = sqlSession.getMapper(ManageOrganDAO.class);
		HttpSession session = request.getSession();
		
		//organ session에 저장된 값을 불러와 기관명을 뽑아 vo세팅
		OrganLoginVO ovo = (OrganLoginVO)session.getAttribute("organ");
		int ono = ovo.getOno();
		vo.setOno(ono);
		
		System.out.println(ono);
		
		//ebook_reqList에 등록(ebook 구매신청)
		dao.ebookReq(vo);
		List<BookInfoVO> ebookList = dao.ebookList();
		
		mav.addObject("ebookList",ebookList);
		mav.setViewName("/organization/organReqForm");
		System.out.println("뷰 이름 : " + mav.getViewName());
		return mav;
	}
	
	@RequestMapping("/mOrganReqList.do")
	public ModelAndView ebookReqList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ManageOrganDAO dao = sqlSession.getMapper(ManageOrganDAO.class);
		HttpSession session = request.getSession();
		
		//session에서 기관명 받아서 설정.
		OrganLoginVO ovo = (OrganLoginVO)session.getAttribute("organ");
		int ono = ovo.getOno();

		//기관별 ebook 신청목록 가져오기
		List<ManageEbookReqListVO> eList = dao.ebookReqList(ono);
		
		mav.addObject("ebook_reqList", eList);
		mav.setViewName("/organization/organReqList");
		System.out.println("뷰 이름 : " + mav.getViewName());
		return mav;
	}
	
	@RequestMapping("/mOrganSearch.do")
	public ModelAndView ebookSearch(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ManageOrganDAO dao = sqlSession.getMapper(ManageOrganDAO.class);
		
		// title 값을 받아 검색
		String title = request.getParameter("title");
		List<BookInfoVO> list = dao.searchEbook(title);
		
		mav.addObject("ebookList", list);
		mav.setViewName("/organization/organReqForm");
		System.out.println("뷰 이름 : " + mav.getViewName());
		return mav;
	}
	
	@RequestMapping("/mOrganDistList.do")
	public ModelAndView ebookDistList(HttpServletRequest request, ManageOrganVO vo){
		ModelAndView mav = new ModelAndView();
		ManageOrganDAO dao = sqlSession.getMapper(ManageOrganDAO.class);
		HttpSession session = request.getSession();
		
		OrganLoginVO ovo = (OrganLoginVO)session.getAttribute("organ");
		int ono = ovo.getOno();
		vo.setOno(ono);
		
		List<ManageOrganVO> list = dao.ebookDistList(vo);
		
		mav.addObject("ebookDistList", list);
		mav.setViewName("/organization/organDistList");
		System.out.println("뷰 이름 : " + mav.getViewName());
		return mav;
	}
}





