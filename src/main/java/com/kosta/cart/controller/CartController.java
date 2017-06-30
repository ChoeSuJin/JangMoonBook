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
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.admin.mInventory.model.BookInfoVO;
import com.kosta.cart.model.CartVO;
import com.kosta.cart.service.CartService;

@Controller
public class CartController {
	
	@Inject 
	CartService cartService;

	@RequestMapping("cartList.do")
	public ModelAndView list(HttpSession session, ModelAndView mav, HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		String id = (String)session.getAttribute("id");
		
		String discountRate = cartService.getDiscountRate(id);
		
		List<CartVO> list=cartService.listCart(id);
		List<CartVO> eList=cartService.listCartEbook(id);
		
		int sumMoney=cartService.sumMoney(id) * ( 100 - (Integer.parseInt(discountRate))) / 100;
		int esumMoney=cartService.sumMoneyEbook(id) * ( 100 - (Integer.parseInt(discountRate))) / 100;
		
		int fee = sumMoney >= 30000 ? 0 : 2500;
		
		map.put("list", list);
		map.put("elist", eList);
		map.put("count", list.size());
		map.put("ecount", eList.size());
		map.put("sumMoney", sumMoney);
		map.put("esumMoney", esumMoney);
		map.put("fee", fee);	
		map.put("sum", sumMoney + fee);	
		map.put("discountRate", discountRate);
		mav.addObject("map", map);
		
		String cmd = request.getParameter("cmd");
		System.out.println("cmd : " + cmd);
		
		if(cmd == null){
			mav.setViewName("customer/cart_list");
		}else if(cmd.equals("payment")){ // 장바구니 탭에서 전체주문 버튼
			mav.setViewName("customer/payment");
		}else if(cmd.equals("epayment")){
			mav.setViewName("customer/epayment");
		}
		return mav;
	}

	@RequestMapping("cartInsert.do")
	public String insert(@ModelAttribute CartVO vo, HttpSession session) {
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		String type = vo.getType(); //ebook은 count 증가 x 하기 위함
		
		System.out.println(vo.getIsbn());
		int count=cartService.countCart(id, vo.getIsbn());
		
		if(type.equals("E-Book")){
			int check1 = cartService.checkInsertEbook(vo); // 장바구니에 ebook이 있는지 체크
			int check2 = cartService.checkInsertEbookSalelist(vo); // 구매목록에 ebook이 있는지 체크
			int check_f = check1 + check2;
			System.out.println("check_ebook : " + check_f);
			
			if(check_f >= 1){
				return "redirect:cartList.do";
			}
			
			cartService.insert(vo);
			return "redirect:cartList.do";
		}
		
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
	
	
	/*@RequestMapping("cartUpdate.do")
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
	}*/
	
	@RequestMapping("selectBranch.do")
	public String selectBranch() {
		
		return "/customer/selectBranch";
	}
	
	
}








