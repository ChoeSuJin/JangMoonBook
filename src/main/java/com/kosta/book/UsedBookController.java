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
		return "registerForUsedBooks/usedWriteForm";
	}
	/*HttpServletRequest request*/
	
}
