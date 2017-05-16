package com.kosta.customer.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.customer.model.CustomerVO;
import com.kosta.customer.service.CustomerService;

@Controller
public class CustomerController {
	
	@Inject
	CustomerService customerService;
	
	@RequestMapping("/customer/list.do")
	public String customerList(Model model){
		List<CustomerVO> list =  customerService.customerList();
		model.addAttribute("list", list);
		return "customer/customerList";
	}

	@RequestMapping("/customer/write.do")
	public String write(){
		
		return "customer/write"; //화면가입폼으로 이동
	}
	
	// insert 처리
	@RequestMapping("/customer/insert.do")
	public String insert(@ModelAttribute CustomerVO vo){	// CustomerVO 매개변수로 받으면, vo에 값이 쌓임
		
		customerService.insertCustomer(vo);
		return "redirect:/customer/list.do";
	}
	
	@RequestMapping("/customer/view.do")
	public String view(String id){
		return "customer/view";
	}
	
}


















