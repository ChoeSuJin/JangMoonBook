package com.kosta.book.admin.mNote.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.login.model.EmployeeVO;
import com.kosta.book.admin.mNote.model.NoteDAO;
import com.kosta.book.admin.mNote.model.NoteVO;

@Controller
public class ManageNoteController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/mNote.do")
	public ModelAndView mNote(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		
		EmployeeVO user = (EmployeeVO) session.getAttribute("user");
		
		String name = user.getName();
		int empNo = user.getEmpNo();
		
		List sendList = dao.viewSentList(empNo);
		List recvList = dao.viewRecvList(empNo);
		
		System.out.println("sendList size = " + sendList.size());
		System.out.println("recvList size = " + recvList.size());
		
		mav.setViewName("/admin/mNote");
		mav.addObject("sendList", sendList);
		mav.addObject("recvList", recvList);
		mav.addObject("sendListSize", sendList.size());
		mav.addObject("recvListSize", recvList.size());
		
		return mav;
		
	}
	
	@RequestMapping("/sendNote.do")
	public ModelAndView sendNote(NoteVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		EmployeeVO user = (EmployeeVO) session.getAttribute("user");
		
		int sent_id = user.getEmpNo();
		vo.setSent_id(String.valueOf(sent_id));
		
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		dao.sendNote(vo);
		
		mav.setViewName("redirect:mNote.do");
		return mav;
	}
	
	@RequestMapping("/recvMsgDel.do")
	public String recvMsgDel(NoteVO vo) {
		
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		
		dao.deleteRecvNote(vo.getNoteNo());
		
		return "redirect:mNote.do";
	}
	
	@RequestMapping("/sentMsgDel.do")
	public String sentMsgDel(NoteVO vo) {
		
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		
		dao.deleteSendNote(vo.getNoteNo());
		
		return "redirect:mNote.do";
	}

}
