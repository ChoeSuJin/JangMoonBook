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
	
	@RequestMapping("mOnlineSales.do")
	public ModelAndView onlineSaleView() {
		
		ModelAndView mav = new ModelAndView();
		
		OnlineSalesDAO dao = sqlSession.getMapper(OnlineSalesDAO.class);
		List list = dao.saleOnlineBook();
		
		String sumDomestic = dao.sumSaleOnlineDomesticBook();
		String sumForeign = dao.sumSaleOnlineForeignBook();
		
		
		mav.setViewName("/admin/mOnlineSales");
		
		mav.addObject("sumDomestic", sumDomestic);
		mav.addObject("sumForeign", sumForeign);
		mav.addObject("list", list);
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
