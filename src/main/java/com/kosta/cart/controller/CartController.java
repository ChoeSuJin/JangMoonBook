package com.kosta.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.cart.model.CartVO;
import com.kosta.cart.service.CartService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	@Inject 
	CartService cartService;

	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session
			, ModelAndView mav){
		Map<String,Object> map = new HashMap<String,Object>();
		String id = (String)session.getAttribute("id");
		List<CartVO> list=cartService.listCart(id);
		
		int sumMoney=cartService.sumMoney(id);
		
		//諛곗넚猷�(3留뚯썝 �씠�긽=>臾대즺, 誘몃쭔=>2500�썝)
		int fee =sumMoney>=30000 ? 0 : 2500;
		
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumMoney", sumMoney);	//�빀怨�
		map.put("fee", fee);	//諛곗넚鍮�
		map.put("sum", sumMoney + fee);	// 珥앺빀怨� (�빀怨� + 諛곗넚鍮�)
		mav.setViewName("cart/cart_list");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("insert.do")
	public String insert(
			@ModelAttribute CartVO vo
			, HttpSession session) {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		
		// �옣諛붽뎄�땲�뿉 湲곗〈 �긽�뭹�씠 �엳�뒗吏� �솗�씤-- �뾾�쑝硫� insert , �엳�쑝硫� update
		int count=cartService.countCart(id, vo.getIsbn());
		if(count==0){
			cartService.insert(vo);
		}else{
			cartService.updateCart(vo);
		}
		return "redirect:/cart/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam String isbn) {
		cartService.delete(isbn);
		return "redirect:/cart/list.do";
	}
	
	
	@RequestMapping("update.do")
	public String update(@RequestParam int[] amount
			, @RequestParam String[] isbn
			, HttpSession session){
		String id = (String)session.getAttribute("id");
		for(int i=0; i<isbn.length; i++) {
			
			CartVO vo=new CartVO();
			vo.setId(id);
			vo.setIsbn(isbn[i]);
			vo.setAmount(amount[i]);
			cartService.modifyCart(vo); 
		}
		return "redirect:/cart/list.do";
	}
	
	
}








