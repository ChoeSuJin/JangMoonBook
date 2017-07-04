package com.kosta.book.admin.mTotalSale.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.mTotalSale.model.TotalSaleDAO;

@Controller
public class ManageTotalSaleController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("mTotalSale.do")
	public ModelAndView totalSale() {
		ModelAndView mav = new ModelAndView();
		
		TotalSaleDAO dao = sqlSession.getMapper(TotalSaleDAO.class);
		
		/*online - 강남 - 광주 - 수원 - 판교*/
		
		List<Integer> listDomestic = dao.getDomesticList();
		List<Integer> listForeign = dao.getForeignList();
		
		int totalDomestic = 0;
		int totalForeign = 0;
		
		for (int i = 0; i < listDomestic.size(); i++) {
			totalDomestic += listDomestic.get(i).intValue();
		}
		
		for (int i = 0; i< listForeign.size();i ++) {
			totalForeign += listForeign.get(i).intValue();
		}
		
		mav.addObject("totalDomestic", totalDomestic);
		mav.addObject("totalForeign", totalForeign);
		mav.addObject("listDomestic", listDomestic);
		mav.addObject("listForeign", listForeign);
		
		mav.setViewName("/admin/manage/mTotalSales");
		
		return mav;
	}

}
