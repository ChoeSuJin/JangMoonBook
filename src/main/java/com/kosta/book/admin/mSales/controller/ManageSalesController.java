package com.kosta.book.admin.mSales.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.login.model.EmployeeVO;
import com.kosta.book.admin.mEbook.model.ManageEbookDAO;
import com.kosta.book.admin.mSales.model.SalesDAO;
import com.kosta.book.admin.mSales.model.SalesListVO;

@Controller
public class ManageSalesController {
	
	@Autowired
	SqlSession sqlSession;
	
	
	@RequestMapping("mSales.do")
	public ModelAndView salesMainForm(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("mSales.do");
		
		SalesListVO vo = new SalesListVO();
		
		HttpSession session = request.getSession();
		
		EmployeeVO user = (EmployeeVO) session.getAttribute("user");
		
		
		vo.setBranchName(user.getBranch());
		System.out.println("user = " + user.getBranch());
		
		
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		List list1 = dao.saleNewBook(vo);

		List list2 = dao.saleForeignBook(vo);
		String sumDomestic = dao.sumSaleDomesticBook(vo);
		String sumForeign = dao.sumSaleForeignBook(vo);
		
		/*새책 판매 목록 페이징 처리*/
		int allNewCount = list1.size();
		int allNewPage =(allNewCount % 10 == 0) ? allNewCount / 10 : allNewCount / 10 + 1;
		int allNewBlock = (allNewPage % 5 == 0) ? allNewPage / 5 : allNewPage / 5 + 1;
		
		mav.addObject("currentNewBlock", 1);
		mav.addObject("currentNewPage", 1);
		mav.addObject("allNewCount", allNewCount);
		mav.addObject("allNewPage", allNewPage);
		mav.addObject("allNewBlock", allNewBlock);
		System.out.println("allNewPage = " + allNewPage);
		System.out.println("allNewBlock = " + allNewBlock);

		mav.addObject("currentNewPage", 1);
		mav.addObject("currentNewBlock", 1);
		
		/*중고책 판매 목록 페이징 처리*/
		int allUsedCount = list2.size();
		int allUsedPage =(allUsedCount % 10 == 0) ? allUsedCount / 10 : allUsedCount / 10 + 1;
		int allUsedBlock = (allUsedPage % 5 == 0) ? allUsedPage / 5 : allUsedPage / 5 + 1;
		
		mav.addObject("currentUsedBlock", 1);
		mav.addObject("currentUsedPage", 1);
		mav.addObject("allUsedCount", allUsedCount);
		mav.addObject("allUsedPage", allUsedPage);
		mav.addObject("allUsedBlock", allUsedBlock);
		System.out.println("allUsedPage = " + allUsedPage);
		System.out.println("allUsedBlock = " + allUsedBlock);

		mav.addObject("currentUsedPage", 1);
		mav.addObject("currentUsedBlock", 1);
		
		
		System.out.println("sumDomestic = " + sumDomestic);
		System.out.println("sumForeign = " + sumForeign);
		
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("sumDomestic", sumDomestic);
		mav.addObject("sumForeign", sumForeign);
	
		
		mav.setViewName("/admin/manage/mSales");
		return mav;
	}
	
	@RequestMapping("/moveNewBlock.do")
	@ResponseBody
	public HashMap<String, Object> moveNewBlock(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		SalesListVO vo = new SalesListVO();
		String branch = map.get("branch");
		vo.setBranchName(branch);
		
		List list = dao.saleNewBook(vo);
		System.out.println(map.get("Block"));
		
		
		data.put("list", list);
		data.put("block", map.get("Block"));
		data.put("page", Integer.parseInt(map.get("Block")) * 5 - 2);
		System.out.println("send Block =" + map.get("Block"));
		System.out.println("send page = " + (Integer.parseInt(map.get("Block")) * 5 - 2));
		
		return data;
	}
	
	@RequestMapping("/moveNewPage.do")
	public @ResponseBody HashMap<String, Object> moveOrganList(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		SalesListVO vo = new SalesListVO();
		String branch = map.get("branch");
		vo.setBranchName(branch);
		List list = dao.saleNewBook(vo);
		
		System.out.println(map.get("currentNewPage"));
		System.out.println(map.get("currentNewBlock"));
		
		
		data.put("list", list);
		data.put("page", map.get("currentNewPage"));
		data.put("block", map.get("currentNewBlock"));
		
		
		return data;
	}
	
	@RequestMapping("/moveUsedBlock.do")
	@ResponseBody
	public HashMap<String, Object> moveUsedBlock(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		SalesListVO vo = new SalesListVO();
		String branch = map.get("branch");
		vo.setBranchName(branch);
		
		List list = dao.saleForeignBook(vo);
		System.out.println(map.get("Block"));
		
		
		data.put("list", list);
		data.put("block", map.get("Block"));
		data.put("page", Integer.parseInt(map.get("Block")) * 5 - 2);
		System.out.println("send Block =" + map.get("Block"));
		System.out.println("send page = " + (Integer.parseInt(map.get("Block")) * 5 - 2));
		
		return data;
	}
	
	@RequestMapping("/moveUsedPage.do")
	public @ResponseBody HashMap<String, Object> moveUsedPage(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		SalesDAO dao = sqlSession.getMapper(SalesDAO.class);
		SalesListVO vo = new SalesListVO();
		String branch = map.get("branch");
		vo.setBranchName(branch);
		List list = dao.saleForeignBook(vo);
		
		System.out.println(map.get("currentUsedPage"));
		System.out.println(map.get("currentUsedBlock"));
		
		
		data.put("list", list);
		data.put("page", map.get("currentUsedPage"));
		data.put("block", map.get("currentUsedBlock"));
		
		
		return data;
	}
}
