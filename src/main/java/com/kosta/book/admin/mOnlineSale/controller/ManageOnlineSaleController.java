package com.kosta.book.admin.mOnlineSale.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.mOnlineSale.model.OnlineSalesDAO;
import com.kosta.book.admin.mSales.model.SalesListVO;

@Controller
public class ManageOnlineSaleController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("mOnlineSale.do")
	public ModelAndView onlineSaleView() {
		
		ModelAndView mav = new ModelAndView();
		
		OnlineSalesDAO dao = sqlSession.getMapper(OnlineSalesDAO.class);
		List list = dao.saleOnlineBook();
		
		String sumDomestic = dao.sumSaleOnlineDomesticBook();
		String sumForeign = dao.sumSaleOnlineForeignBook();
		
		
		mav.setViewName("/admin/manage/mOnlineSales");
		
		int allOnlineCount = list.size();
		int allOnlinePage =(allOnlineCount % 10 == 0) ? allOnlineCount / 10 : allOnlineCount / 10 + 1;
		int allOnlineBlock = (allOnlinePage % 5 == 0) ? allOnlinePage / 5 : allOnlinePage / 5 + 1;
		
		mav.addObject("list", list);
		mav.addObject("currentOnlineBlock", 1);
		mav.addObject("currentOnlinePage", 1);
		mav.addObject("allOnlineCount", allOnlineCount);
		mav.addObject("allOnlinePage", allOnlinePage);
		mav.addObject("allOnlineBlock", allOnlineBlock);
		System.out.println("allOnlinePage = " + allOnlinePage);
		System.out.println("allOnlineBlock = " + allOnlineBlock);

		mav.addObject("currentOnlinePage", 1);
		mav.addObject("currentOnlineBlock", 1);
		mav.addObject("sumDomestic", sumDomestic);
		mav.addObject("sumForeign", sumForeign);
		return mav;
	}
	
	@RequestMapping("/moveOnlineBlock.do")
	@ResponseBody
	public HashMap<String, Object> moveOnlineBlock(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		OnlineSalesDAO dao = sqlSession.getMapper(OnlineSalesDAO.class);
		SalesListVO vo = new SalesListVO();
		String branch = map.get("branch");
		vo.setBranchName(branch);
		
		List list = dao.saleOnlineBook();
		System.out.println(map.get("Block"));
		
		
		data.put("list", list);
		data.put("block", map.get("Block"));
		data.put("page", Integer.parseInt(map.get("Block")) * 5 - 2);
		System.out.println("send Block =" + map.get("Block"));
		System.out.println("send page = " + (Integer.parseInt(map.get("Block")) * 5 - 2));
		
		return data;
	}
	
	@RequestMapping("/moveOnlinePage.do")
	public @ResponseBody HashMap<String, Object> moveOrganList(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		OnlineSalesDAO dao = sqlSession.getMapper(OnlineSalesDAO.class);
		SalesListVO vo = new SalesListVO();
		String branch = map.get("branch");
		vo.setBranchName(branch);
		List list = dao.saleOnlineBook();
		
		System.out.println(map.get("currentOnlinePage"));
		System.out.println(map.get("currentOnlineBlock"));
		
		
		data.put("list", list);
		data.put("page", map.get("currentOnlinePage"));
		data.put("block", map.get("currentOnlineBlock"));
		
		
		return data;
	}
	

}
