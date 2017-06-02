package com.kosta.customer.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.cart.model.CartVO;
import com.kosta.cart.service.CartServiceImpl;
import com.kosta.customer.model.BookDAO;
import com.kosta.customer.model.BookVO;
import com.kosta.customer.model.UsedBookDAO;

@Controller
public class BookController {

	@Autowired
	private SqlSession sqlSession;
	@Inject
	CartServiceImpl cartServiceImpl;
	
	@RequestMapping("/searchBook.do")
	public String list(Model model, BookVO vo, HttpServletRequest request) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		model.addAttribute("list", bookDAO.bookSearchDao(vo));
		
		/*List list = bookDAO.bookNoTypeSearchDao(vo);*/
		List list = bookDAO.bookSearchDao(vo);
		
		int contents = list.size();	// 검색된 책 갯수
		int contentsPerPage = 20;
		int currentBlock = 0;
		int currentPage = 0;
		int PagePerBlock = 5;
		int allPage = contents / contentsPerPage;	// 전체 페이지 갯수
		int allBlock = allPage / PagePerBlock;		// 전체 블록 갯수	
		
		String rCurrentPage = request.getParameter("currentPage");	
		String rCurrentBlock = request.getParameter("currentBlock");
		
		System.out.println("현제 블럭 : " + rCurrentBlock);

		if (rCurrentBlock == null) currentBlock = 1;
		else currentBlock = Integer.parseInt(rCurrentBlock);	
		if (rCurrentPage == null) currentPage = 1;
		else currentPage = Integer.parseInt(rCurrentPage);		
			
		if (currentBlock>allBlock) currentBlock=allBlock+1;
		System.out.println(currentBlock);
		if (0>=currentBlock) currentBlock=1;

		int begin = (currentBlock-1)*PagePerBlock+1;
		int suend = (currentBlock-1)*PagePerBlock+5;
		if (suend>=allPage) suend=allPage+1;
		
		int start = (currentPage - 1)* contentsPerPage + 1;
		int end = start + contentsPerPage - 1;
		
		System.out.println("스타트 : " + start);

		String beginB = "no";
		String suendB = "no";
		
		if (begin==1) beginB = "ok";
		if (suend==allPage+1)suendB = "ok";
		
		String fullUri = request.getRequestURI();
		String uri = fullUri.substring(fullUri.lastIndexOf("/"));

		model.addAttribute("uri", uri);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("category", vo.getCategory());
		model.addAttribute("type", vo.getType());
		model.addAttribute("pagenum", request.getAttribute("pageNum"));
		model.addAttribute("contents", contents);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentBlock", currentBlock);
		model.addAttribute("begin", begin);
		model.addAttribute("suend", suend);
		model.addAttribute("beginB", beginB);
		model.addAttribute("suendB", suendB);
		return "customer/orderBook";
	}	
	
	@RequestMapping("/orderBook.do")
	public String bookSearchByType(Model model, BookVO vo, HttpServletRequest request) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		vo.setType(request.getParameter("type"));
		System.out.println("type : " + vo.getType());
		model.addAttribute("list", bookDAO.orderBook(vo));
		model.addAttribute("booktype", vo.getType());
		return "customer/orderBook";
	}	

	@RequestMapping("/orderBookDetail.do")
	public String bookDetail(Model model, BookVO vo) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		model.addAttribute("bookDetail", bookDAO.orderBookDetail(vo));
		return "customer/orderBookDetail";
	}
	
	@RequestMapping("/bookType.do")
	public String bookType(Model model, BookVO vo) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		model.addAttribute("list", bookDAO.bookSearchDao(vo));
		
		return "bookList/bookList";
	}
	
	@RequestMapping("/bookWrite.do")
	public String write(BookVO vo) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		bookDAO.bookWrite(vo);
		return "redirect:../book/";
	}
	
	@RequestMapping("/bookTypeSearch.do")
	public String typeList(Model model, BookVO vo, HttpServletRequest request) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		String link = "bookList/bookList";
		List list; // = bookDAO.bookNoTypeSearchDao(vo);
		if (vo.getType().equals("all")) {
			list = bookDAO.bookNoTypeSearchDao(vo);
		}else if(vo.getType().equals("usedSelect")){
			link = "registerForUsedBooks/usedSelect";
			list = bookDAO.usedSelectDao(vo);
		}else {
			list = bookDAO.bookTypeSearchDao(vo);
		}
		model.addAttribute("list", list);
		int contents = list.size();	// 검색된 책 갯수
		int contentsPerPage = 20;
		int currentBlock = 0;
		int currentPage = 0;
		int PagePerBlock = 5;
		int allPage = contents / contentsPerPage;	// 전체 페이지 갯수
		int allBlock = allPage / PagePerBlock;		// 전체 블록 갯수	
		
		String rCurrentPage = request.getParameter("currentPage");	
		String rCurrentBlock = request.getParameter("currentBlock");
		
		System.out.println("현제 블럭 : " + rCurrentBlock);

		if (rCurrentBlock == null) currentBlock = 1;
		else currentBlock = Integer.parseInt(rCurrentBlock);	
		if (rCurrentPage == null) currentPage = 1;
		else currentPage = Integer.parseInt(rCurrentPage);		
		int start = (currentPage - 1)* contentsPerPage + 1;
		int end = start + contentsPerPage - 1;
			
		if (currentBlock>allBlock) currentBlock=allBlock+1;
		System.out.println(currentBlock);
		if (0>=currentBlock) currentBlock=1;
		
		int begin = (currentBlock-1)*5+1;
		int suend = (currentBlock-1)*5+5;
		if (suend>=allPage) suend=allPage+1;
		
		String beginB = "no";
		String suendB = "no";
		
		if (begin==1) beginB = "ok";
		if (suend==allPage+1)suendB = "ok";
		
		String fullUri = request.getRequestURI();
		String uri = fullUri.substring(fullUri.lastIndexOf("/"));

		model.addAttribute("uri", uri);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("category", vo.getCategory());
		model.addAttribute("type", vo.getType());
		model.addAttribute("pagenum", request.getAttribute("pageNum"));
		model.addAttribute("contents", contents);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentBlock", currentBlock);
		model.addAttribute("begin", begin);
		model.addAttribute("suend", suend);
		model.addAttribute("beginB", beginB);
		model.addAttribute("suendB", suendB);

		return link;
	}
	

	@RequestMapping("/usedSelect")
	public String usedSelect(Model model, BookVO vo) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		model.addAttribute("list", bookDAO.bookNoTypeSearchDao(vo));
		return "registerForUsedBooks/usedSelect";
	}
	
	@RequestMapping("/usedBookWrite.do")
	public String usedBookWrite(Model model, BookVO vo, HttpSession session) {
		BookDAO bookDAO = sqlSession.getMapper(BookDAO.class);
		model.addAttribute("book", bookDAO.bookOneSearchDao(vo));
		model.addAttribute("id", session.getAttribute("id"));
		return "registerForUsedBooks/usedWrite";
	}
	@RequestMapping("/usedWrite.do")
	public String usedWrite(BookVO vo, HttpSession session) {
		UsedBookDAO usedBookDAO = sqlSession.getMapper(UsedBookDAO.class);
		vo.setId((String)session.getAttribute("id"));
		usedBookDAO.writeDao(vo);
		return "redirect:../book/";
	}
	// 구매랑 장바구니 할꺼임
	
	@RequestMapping("/bookCart.do")
	public String bookCart(@ModelAttribute CartVO vo, HttpSession session) throws Exception{
		if ((String)session.getAttribute("id")==null) {
			System.out.println("아이디 입력 안함");
			return "redirect:../book/";
		}
		vo.setId((String)session.getAttribute("id"));
		cartServiceImpl.insert(vo);		
		
		
		return "redirect:../book/";
	}
	
	/*@RequestMapping("/buyABook")
	public String buyABook(@ModelAttribute CartVO vo, HttpSession session) throws Exception{
		if ((String)session.getAttribute("id")==null) {
			System.out.println("아이디 입력 안함");
			return "redirect:../book/";
		}	
		cartServiceImpl.buyABook(vo);
		return "redirect:../book/";
	}*/
}
