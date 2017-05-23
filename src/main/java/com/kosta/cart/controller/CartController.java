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
		Map<String,Object> map = new HashMap<>();
		String id = (String)session.getAttribute("id");
		List<CartVO> list=cartService.listCart(id);
		
		int sumMoney=cartService.sumMoney(id);
		
		//배송료(3만원 이상=>무료, 미만=>2500원)
		int fee =sumMoney>=30000 ? 0 : 2500;
		
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumMoney", sumMoney);	//합계
		map.put("fee", fee);	//배송비
		map.put("sum", sumMoney + fee);	// 총합계 (합계 + 배송비)
		mav.setViewName("cart/cart_list");
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("insert.do")
	public String insert(
			@ModelAttribute CartVO vo
			, HttpSession session) {
		String id=
				(String)session.getAttribute("id");
		vo.setId(id);
		
		// 장바구니에 기존 상품이 있는지 확인-- 없으면 insert , 있으면 update
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








