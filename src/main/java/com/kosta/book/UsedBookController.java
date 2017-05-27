package com.kosta.book;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsedBookController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("usedWriteForm")
	public String writeForm(HttpSession session) {
		String id=(String)session.getAttribute("id");
		String url = null;
		if (id==null) {
			url="redirect:../book";
		}else {
			url = "registerForUsedBooks/usedWriteForm";
		}
		return url;
	}
	/*HttpServletRequest request*/
}
