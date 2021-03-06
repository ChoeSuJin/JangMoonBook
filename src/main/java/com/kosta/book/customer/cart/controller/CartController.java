package com.kosta.book.customer.cart.controller;

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

import com.kosta.book.customer.cart.model.CartVO;
import com.kosta.book.customer.cart.service.CartService;

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
		
		//諛곗?��?���?(3留뚯?�� �씠�긽=>?��??�?, 誘몃�?=>2500�썝)
		int fee =sumMoney>=30000 ? 0 : 2500;
		
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumMoney", sumMoney);	//��??��
		map.put("fee", fee);	//諛곗?��?���?
		map.put("sum", sumMoney + fee);	// ?��?���??�� (��??�� + 諛곗?��?���?)
		mav.setViewName("cart/cart_list");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("insert.do")
	public String insert(
			@ModelAttribute CartVO vo, HttpSession session) {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		
		// �옣諛붽?���땲�뿉 湲곗?? �긽��?��?�� �엳�뒗吏� �솗�씤-- �뾾�쑝硫� insert , �엳�쑝硫� update
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
	
	@RequestMapping("selectBranch.do")
	public String selectBranch() {
		
		return "/cart/selectBranch";
	}
	
	
}








