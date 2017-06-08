package com.kosta.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.mInventory.model.BookInfoVO;
import com.kosta.cart.model.CartVO;
import com.kosta.cart.service.CartService;
import com.kosta.customer.model.CustomerVO;

@Controller
public class CartController {
	
	@Inject 
	CartService cartService;

	@RequestMapping("cartList.do")
	public ModelAndView list(HttpSession session, ModelAndView mav, HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		String id = (String)session.getAttribute("id");
		
		List<CartVO> list=cartService.listCart(id);
		
		int sumMoney=cartService.sumMoney(id);
		
		int fee = sumMoney >= 30000 ? 0 : 2500;
		
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumMoney", sumMoney);	
		map.put("fee", fee);	
		map.put("sum", sumMoney + fee);	
		mav.addObject("map", map);
		
		if(request.getParameter("cmd")!=null){ // 장바구니 탭에서 전체주문 버튼
			mav.setViewName("customer/payment");
			return mav;
		}
		mav.setViewName("customer/cart_list");
		return mav;
	}
	
	@RequestMapping("cartInsert.do")
	public String insert(@ModelAttribute CartVO vo, HttpSession session) {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		
		System.out.println(vo.getIsbn());
		int count=cartService.countCart(id, vo.getIsbn());
		
		if(count==0){
			cartService.insert(vo);
		}else{
			cartService.updateCart(vo);
		}
		return "redirect:cartList.do";
	}
	
	@RequestMapping("cartDelete.do")
	public String delete(BookInfoVO vo, HttpSession session) {
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		cartService.delete(vo);
		return "redirect:cartList.do";
	}
	
	
	@RequestMapping("cartUpdate.do")
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








