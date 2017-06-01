package com.kosta.book.admin.mEbook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.mEbook.model.ManageEbookDAO;
import com.kosta.book.admin.mEbook.model.ManageEbookExtendReqListVO;
import com.kosta.book.admin.mEbook.model.ManageEbookListVO;
import com.kosta.book.admin.mEbook.model.ManageEbookOrganVO;
import com.kosta.book.admin.mEbook.model.ManageEbookReqListVO;

@Controller
public class ManageEbookController {
	
	@Autowired
	SqlSession sqlSesison;
	
	
	@RequestMapping("/mEbook.do")
	public ModelAndView EbookManagePOST() {
		
		ModelAndView mav = new ModelAndView();
		
		ManageEbookDAO dao = sqlSesison.getMapper(ManageEbookDAO.class);
		
		//List<ManageEbookListVO> list1 = dao.getEbookList();
		List<ManageEbookOrganVO> list2 = dao.getEbookOrganList();
		List<ManageEbookReqListVO> list3 = dao.getEbookPermitList();
		List<ManageEbookExtendReqListVO> list4 = dao.getEbookExtendReqList();
		
		// contents per page = 3
		// page per block = 3

		
		//int allCount = dao.getAllOrganBookListCount();
		int allOrganCount = dao.getAllOrganListCount();
		int allOrganPage =(allOrganCount % 3 == 0) ? allOrganCount / 3 : allOrganCount / 3 + 1;
		int allOrganBlock = (allOrganPage % 3 == 0) ? allOrganPage / 3 : allOrganPage / 3 + 1;
		mav.setViewName("/admin/manage/mEbook");
		
		//mav.addObject("ebookList", list1);
		mav.addObject("organList", list2);
		mav.addObject("permitList", list3);
		mav.addObject("extendList", list4);
		
		mav.addObject("org_currentBlock", 1);
		mav.addObject("org_currentPage", 1);
		mav.addObject("allOrganCount", allOrganCount);
		mav.addObject("allOrganPage", allOrganPage);
		mav.addObject("allOrganBlock", allOrganBlock);
		System.out.println("allOrganPage = " + allOrganPage);
		System.out.println("allOrganBlock = " + allOrganBlock);

		/*mav.addObject("allContent", allCount);
		mav.addObject("allPage", allPage);
		mav.addObject("allBlock", allBlock);*/
		mav.addObject("currentPage", 1);
		mav.addObject("currentBlock", 1);
		return mav;
		
	}
	
	@RequestMapping("/getOrgList.do")
	@ResponseBody
	public HashMap<String, Object> getOrgList(@RequestParam Map<String, String> map) {
		System.out.println("getOrgList.do");
		//System.out.println(ono);
		System.out.println(map.get("ono"));
		
		String ono = map.get("ono");
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		ManageEbookDAO dao = sqlSesison.getMapper(ManageEbookDAO.class);
		ManageEbookOrganVO vo = new ManageEbookOrganVO();
		vo.setOno(Integer.parseInt(ono));
		List list = dao.getEbookList(vo);
		
		for (int i = 0 ; i < list.size(); i++) {
			ManageEbookListVO v = (ManageEbookListVO) list.get(i);
			System.out.println(v.getIsbn());
		}
		
		data.put("ebookList", list);
		data.put("ono", ono);
		
		return data;
	}
	
	@RequestMapping("/movePage.do")
	public @ResponseBody HashMap<String, Object> moveOrganList(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		ManageEbookDAO dao = sqlSesison.getMapper(ManageEbookDAO.class);
		List list = dao.getEbookOrganList();
		
		System.out.println(map.get("org_currentPage"));
		System.out.println(map.get("org_currentBlock"));
		
		
		data.put("list", list);
		data.put("page", map.get("org_currentPage"));
		data.put("block", map.get("org_currentBlock"));
		
		
		return data;
	}
	
	@RequestMapping("/moveBlock.do")
	@ResponseBody
	public HashMap<String, Object> moveBlock(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		ManageEbookDAO dao = sqlSesison.getMapper(ManageEbookDAO.class);
		List list = dao.getEbookOrganList();
		
		System.out.println(map.get("Block"));
		
		
		data.put("list", list);
		data.put("block", map.get("Block"));
		data.put("page", Integer.parseInt(map.get("Block")) * 3 - 2);
		System.out.println("send Block =" + map.get("Block"));
		System.out.println("send page = " + (Integer.parseInt(map.get("Block")) * 3 - 2));
		
		return data;
	}
	
	
	@RequestMapping("/insertNewCom.do")
	public String insertNewCompany(ManageEbookOrganVO vo) {
		
		ManageEbookDAO dao = sqlSesison.getMapper(ManageEbookDAO.class);
		
		dao.insertNewCompany(vo);
		
		

		return "redirect:mEbook.do";
	}
	
	@RequestMapping("/permitEbook.do")
	@Transactional
	public String permitEbook(ManageEbookReqListVO vo) {
		
		ManageEbookDAO dao = sqlSesison.getMapper(ManageEbookDAO.class);
		System.out.println("permitEbook.do");
		
		System.out.println("reqNo = " + vo.getReqNo());
		
		ManageEbookListVO mVo = new ManageEbookListVO();
		mVo.setOno(vo.getOno());
		mVo.setIsbn(vo.getIsbn());
		mVo.setTitle(vo.getTitle());
		
		
		dao.insertEbookPermit(mVo);
		dao.deleteEbookPermit(vo);
		
		return "redirect:mEbook.do";
	}
	
	@RequestMapping("/extendPermit.do")
	public String extendPermit(ManageEbookExtendReqListVO vo) {
		
		ManageEbookDAO dao = sqlSesison.getMapper(ManageEbookDAO.class);
		
		System.out.println("extendPermit.do");
		
		dao.updateExtendOrgan(vo);
		dao.deleteExtendOrgan(vo);
		
		return "redirect:mEbook.do";
	}
	
	

}
