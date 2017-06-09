package com.kosta.book.admin.mOnlineInventory.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.login.model.EmployeeVO;
import com.kosta.book.admin.mOnlineInventory.model.OnlineInventoryDAO;
import com.kosta.book.admin.mOnlineInventory.model.OrderListVO;

@Controller
public class mOnlineInventoryController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("mOnlineInventory.do")
	public ModelAndView inventoryMainForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		EmployeeVO vo = (EmployeeVO) session.getAttribute("user");
		String branch = vo.getBranch();
		
		System.out.println("branch = " + branch);
		
		ModelAndView mav = new ModelAndView();
		
		OnlineInventoryDAO dao = sqlSession.getMapper(OnlineInventoryDAO.class);

		List list = dao.selectEmergency();
		List list2 = dao.selectNormal();
		List list3 = dao.selectOrderList();

		/*����� ���� ����¡*/

		int allCount = list2.size();
		int allPage =(allCount % 10 == 0) ? allCount / 10 : allCount / 10 + 1;
		int allBlock = (allPage % 5 == 0) ? allPage / 5 : allPage / 5 + 1;
		
		mav.addObject("currentBlock", 1);
		mav.addObject("currentPage", 1);
		mav.addObject("allCount", allCount);
		mav.addObject("allPage", allPage);
		mav.addObject("allBlock", allBlock);
		System.out.println("allPage = " + allPage);
		System.out.println("allBlock = " + allBlock);

		mav.addObject("currentPage", 1);
		mav.addObject("currentBlock", 1);
		mav.setViewName("/admin/manage/mOnlineInventory");
		mav.addObject("list", list);
		mav.addObject("list2", list2);
		mav.addObject("list3", list3);
		return mav;
	}
	
	@RequestMapping("orderOnlineInven.do")
	public String orderInven(OrderListVO vo) {
		
		System.out.println("branch = " + vo.getBranch());
	
		OnlineInventoryDAO dao = sqlSession.getMapper(OnlineInventoryDAO.class);
		
		// cost, publisher�� ��� �������� �ۼ��Ͽ� set �޼ҵ忡 �Է�
		
		
		// ��¥ó�� => db���� sysdate�� ó�������ϴ�
		
		vo.setPublisher(dao.getPublisher(vo.getIsbn()));
		vo.setCost(dao.getCost(vo.getIsbn()));		
		
		dao.insertOrderList(vo);
		return "redirect:mOnlineInventory.do";
		
	}
	
	@Transactional
	@RequestMapping("orderOnlineConfirm.do")
	public String orderConfirm(OrderListVO vo) {
		
		System.out.println("orderConfirm.do");
		
		System.out.println("quantity = " + vo.getQuantity());
		System.out.println("isbn = " + vo.getIsbn());
		OnlineInventoryDAO dao = sqlSession.getMapper(OnlineInventoryDAO.class);
		dao.orderConfirm(vo);
		dao.deleteOrder(vo);
		
		
		return "redirect:mOnlineInventory.do";
	}
	
	@RequestMapping("/moveOnlineInventoryBlock.do")
	@ResponseBody
	public HashMap<String, Object> moveBlock(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		OnlineInventoryDAO dao = sqlSession.getMapper(OnlineInventoryDAO.class);
		String branch = map.get("branch");

		List list = dao.selectNormal();
		System.out.println(map.get("Block"));
		
		
		data.put("list", list);
		data.put("block", map.get("Block"));
		data.put("page", Integer.parseInt(map.get("Block")) * 5 - 2);
		System.out.println("send Block =" + map.get("Block"));
		System.out.println("send page = " + (Integer.parseInt(map.get("Block")) * 5 - 2));
		
		return data;
	}
	
	@RequestMapping("/moveOnlineInventoryPage.do")
	public @ResponseBody HashMap<String, Object> moveOrganList(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		OnlineInventoryDAO dao = sqlSession.getMapper(OnlineInventoryDAO.class);
		String branch = map.get("branch");

		List list = dao.selectNormal();
		
		System.out.println(map.get("currentPage"));
		System.out.println(map.get("currentBlock"));
		
		
		data.put("list", list);
		data.put("page", map.get("currentPage"));
		data.put("block", map.get("currentBlock"));
		
		
		return data;
	}

}
