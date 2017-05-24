package com.kosta.book.organ.mOrgan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
		//ebook ��� �̱�
		List<BookInfoVO> ebookList = dao.ebookList();
		
		mav.addObject("ebookList",ebookList);
		mav.setViewName("/organization/organReqForm");
		return mav;
	}
	
	@RequestMapping("/mOrganReq.do")
	public ModelAndView reqEbook(ManageOrganVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ManageOrganDAO dao = sqlSession.getMapper(ManageOrganDAO.class);
		HttpSession session = request.getSession();
		
		//organ session�� ����� ���� �ҷ��� ������� �̾� vo����
		OrganLoginVO ovo = (OrganLoginVO)session.getAttribute("organ");
		String com = ovo.getOname();
		vo.setCom(com);
		
		//ebook_reqList�� ���(ebook ��û)
		dao.ebookReq(vo);
		List<BookInfoVO> ebookList = dao.ebookList();
		
		mav.addObject("ebookList",ebookList);
		mav.setViewName("/organization/organReqForm");
		return mav;
	}
	
	@RequestMapping("/mOrganReqList.do")
	public ModelAndView ebookReqList(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ManageOrganDAO dao = sqlSession.getMapper(ManageOrganDAO.class);
		HttpSession session = request.getSession();
		
		//session���� ����� �޾Ƽ� ����.
		OrganLoginVO ovo = (OrganLoginVO)session.getAttribute("organ");
		String com = ovo.getOname();

		//����� ebook ��û��� ��������
		List<ManageOrganVO> eList = dao.ebookReqList(com);
		
		mav.addObject("ebook_reqList", eList);
		mav.setViewName("/organization/organReqList");
		return mav;
	}
}





