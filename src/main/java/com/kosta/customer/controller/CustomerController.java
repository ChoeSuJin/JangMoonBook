package com.kosta.customer.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.customer.model.CustomerVO;
import com.kosta.customer.service.CustomerService;

@Controller
public class CustomerController {
	
	@Inject
	CustomerService customerService;
	
	@RequestMapping("/customer/login.do")
	public String customerLogin(){
		return "/customer/login";	
	}
	
	@RequestMapping("/customer/loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute CustomerVO vo, HttpSession session){
		boolean result = customerService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		
		if(result == true){
			mav.setViewName("mainPage");
		}else{
			mav.setViewName("customer/login");
			mav.addObject("message", "error");
		}
		return mav;	
	}
	
	@RequestMapping("/customer/logout.do")
	public ModelAndView logout(HttpSession session){
		customerService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/login");
		mav.addObject("message", "logout");
		
		return mav;
	}
	
	
	@RequestMapping("/customer/list.do")
	public String customerList(Model model){
		List<CustomerVO> list =  customerService.customerList();
		model.addAttribute("list", list);
		return "customer/customerList";
	}

	@RequestMapping("/customer/write.do")
	public String write(){
		
		return "customer/write"; 
	}
	
	@RequestMapping("/customer/insert.do")
	public String insert(@ModelAttribute CustomerVO vo){	
		vo.setCustomerClass("silver");
		customerService.insertCustomer(vo);
		return "redirect:/customer/list.do";
	}
	
	@RequestMapping("/customer/view.do")
	public String view(String id, Model model){		
		model.addAttribute("dto", customerService.viewCustomer(id));		
		return "customer/view";
	}
	
	@RequestMapping("/customer/update.do")
	public String update(@ModelAttribute CustomerVO vo, Model model){

		boolean result = customerService.checkPwd(vo.getId(), vo.getPwd());
		if(result){
			customerService.updateCustomer(vo);
			return "redirect:/customer/list.do";
		}else{
			
			CustomerVO vo2 = customerService.viewCustomer(vo.getId());
			vo.setCustomerClass(vo2.getCustomerClass());
			
			model.addAttribute("dto", vo);
			model.addAttribute("message", "업데이트 성공!");
			return "customer/view";
		}
	
		
	}
	
	@RequestMapping("/customer/delete.do")
	public String delete(@RequestParam String id, @RequestParam String pwd, Model model){
	
				boolean result = customerService.checkPwd(id, pwd);
				if(result){
					customerService.deleteCustomer(id);
					return "redirect:/customer/list.do";
					
				}else{
					model.addAttribute("message", "삭제 성공");
					model.addAttribute("dto", customerService.viewCustomer(id));
					return "customer/view";
				}
		
	}
}
