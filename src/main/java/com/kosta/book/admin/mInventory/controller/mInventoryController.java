package com.kosta.book.admin.mInventory.controller;

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
import com.kosta.book.admin.mInventory.model.BookInfoVO;
import com.kosta.book.admin.mInventory.model.InventoryDAO;
import com.kosta.book.admin.mInventory.model.InventoryVO;
import com.kosta.book.admin.mInventory.model.OrderListVO;
import com.kosta.pay.model.GetDirectVO;
import com.kosta.pay.model.PayDAO;

@Controller
public class mInventoryController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("mInventoryEmergency.do")
	public ModelAndView inventoryEmergency(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		EmployeeVO vo = (EmployeeVO) session.getAttribute("user");
		String branch = vo.getBranch();
		
		System.out.println("branch = " + branch);
		
		ModelAndView mav = new ModelAndView();
		
		InventoryDAO dao = sqlSession.getMapper(InventoryDAO.class);

		List list = dao.selectEmergency(branch);

		mav.setViewName("/admin/mInventoryEmer");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("mInventoryNormal.do")
	public ModelAndView inventoryNormal(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		EmployeeVO vo = (EmployeeVO) session.getAttribute("user");
		String branch = vo.getBranch();
		
		System.out.println("branch = " + branch);
		
		ModelAndView mav = new ModelAndView();
		
		InventoryDAO dao = sqlSession.getMapper(InventoryDAO.class);

		List list = dao.selectNormal(branch);

		mav.setViewName("/admin/mInventoryNormal");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("mInventoryOrder.do")
	public ModelAndView inventoryOrder(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		EmployeeVO vo = (EmployeeVO) session.getAttribute("user");
		String branch = vo.getBranch();
		
		System.out.println("branch = " + branch);
		
		ModelAndView mav = new ModelAndView();
		
		InventoryDAO dao = sqlSession.getMapper(InventoryDAO.class);

		List list = dao.selectOrderList(branch);

		mav.setViewName("/admin/mInventoryNormal");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("mInventoryNewBook.do")
	public String inventoryNewBook() {
		
		return "/admin/mInventoryNewBook";
	}
	
	@RequestMapping("mInventoryGetDirectList.do")
	public ModelAndView inventoryGetDirectList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		EmployeeVO vo = (EmployeeVO) session.getAttribute("user");
		String branch = vo.getBranch();
		
		System.out.println("branch = " + branch);
		
		ModelAndView mav = new ModelAndView();
		
		InventoryDAO dao = sqlSession.getMapper(InventoryDAO.class);

		List list = dao.selectGetDirectList(branch);

		mav.setViewName("/admin/mInventoryGetDirect");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("orderInven.do")
	public String orderInven(OrderListVO vo) {
		
		System.out.println("branch = " + vo.getBranch());
	
		InventoryDAO dao = sqlSession.getMapper(InventoryDAO.class);
		
		// cost, publisher占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙占쏙옙 占쌜쇽옙占싹울옙 set 占쌨소드에 占쌉뤄옙
		
		
		// 占쏙옙짜처占쏙옙 => db占쏙옙占쏙옙 sysdate占쏙옙 처占쏙옙占쏙옙占쏙옙占싹댐옙
		
		vo.setPublisher(dao.getPublisher(vo.getIsbn()));
		vo.setCost(dao.getCost(vo.getIsbn()));		
		
		dao.insertOrderList(vo);
		return "redirect:mInventoryOrder.do";
		
	}
	
	@Transactional
	@RequestMapping("orderConfirm.do")
	public String orderConfirm(OrderListVO vo) {
		
		System.out.println("orderConfirm.do");
		
		System.out.println("quantity = " + vo.getQuantity());
		System.out.println("isbn = " + vo.getIsbn());
		InventoryDAO dao = sqlSession.getMapper(InventoryDAO.class);
		dao.orderConfirm(vo);
		dao.deleteOrder(vo);
		
		
		return "redirect:mInventoryOrder.do";
	}
	
	@RequestMapping("insertNewBook.do")
	public String newBookInsert(BookInfoVO vo, HttpServletRequest request) throws IOException {
		
		System.out.println("insertNewBook.do");
		
		InventoryDAO dao = sqlSession.getMapper(InventoryDAO.class);
		
		System.out.println("title = " + vo.getTitle());
		CommonsMultipartFile file = vo.getFile();
		System.out.println("image name = " + file.getName());
		
		if (file != null) {
			String fname = file.getOriginalFilename();
			String path = request.getServletContext().getRealPath("/bookinfo");
			String fullPath = path + "\\" + fname;
			System.out.println("path = " + path);
			if (!fname.equals("")) {
				
				FileOutputStream fs = new FileOutputStream(fullPath);
				fs.write(file.getBytes());
				fs.close();
				
			}
			vo.setImage(fname);
			dao.newBookInsert(vo);
					
		}
		
		return "redirect:mInventoryNormal.do";
	}
	
	@RequestMapping("/moveInventoryBlock.do")
	@ResponseBody
	public HashMap<String, Object> moveBlock(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		InventoryDAO dao = sqlSession.getMapper(InventoryDAO.class);
		String branch = map.get("branch");

		List list = dao.selectNormal(branch);
		System.out.println(map.get("Block"));
		
		
		data.put("list", list);
		data.put("block", map.get("Block"));
		data.put("page", Integer.parseInt(map.get("Block")) * 5 - 2);
		System.out.println("send Block =" + map.get("Block"));
		System.out.println("send page = " + (Integer.parseInt(map.get("Block")) * 5 - 2));
		
		return data;
	}
	
	@RequestMapping("/moveInventoryPage.do")
	public @ResponseBody HashMap<String, Object> moveOrganList(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		InventoryDAO dao = sqlSession.getMapper(InventoryDAO.class);
		String branch = map.get("branch");

		List list = dao.selectNormal(branch);
		
		System.out.println(map.get("currentPage"));
		System.out.println(map.get("currentBlock"));
		
		
		data.put("list", list);
		data.put("page", map.get("currentPage"));
		data.put("block", map.get("currentBlock"));
		
		
		return data;
	}
	
	@RequestMapping("/proGetDirect.do")
	public String proGetDirect(GetDirectVO vo) {
		
		InventoryDAO dao = sqlSession.getMapper(InventoryDAO.class);
		dao.minusInventory(vo);
		System.out.println("minusInventory");
		dao.updatePaid(vo);
		System.out.println("updatePaid");
		dao.deleteGetDirect(vo);
		System.out.println("deleteGetDirect");
		

		return "redirect:mInventoryGetDirectList.do";
	}

}
