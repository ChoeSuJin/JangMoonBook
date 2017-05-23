package com.kosta.book;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.customer.model.BookVO;
import com.kosta.customer.model.UsedBookDAO;

@Controller
public class UsedBookController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("usedWriteForm")
	public String writeForm() {
		System.out.println("나 여기로 왔어요");
		return "registerForUsedBooks/usedWriteForm";
	}
	/*HttpServletRequest request*/
	@RequestMapping("/usedWrite")
	public String write(BookVO vo, Model model) {
		UsedBookDAO usedBookDAO = sqlSession.getMapper(UsedBookDAO.class);
		usedBookDAO.writeDao(vo);
		return "redirect:../book/";
	}
}
