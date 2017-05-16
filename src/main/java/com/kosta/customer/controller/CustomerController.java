package com.kosta.customer.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosta.customer.model.CustomerVO;
import com.kosta.customer.service.CustomerService;

@Controller
public class CustomerController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
								// CustomerController 클래스에 있는 Logger를 수집하겠다.
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
	public String view(String id, Model model){
		logger.info("클릭한 아이디 : "+id);
		
		model.addAttribute("dto", customerService.viewCustomer(id));		
		return "customer/view";
	}
	
	@RequestMapping("/customer/update.do")
	public String update(@ModelAttribute CustomerVO vo){
		customerService.updateCustomer(vo);
		return "redirect:/customer/list.do";
	}
	
	@RequestMapping("/customer/delete.do")
	public String delete(@RequestParam String id){
		customerService.deleteCustomer(id);
		return "redirect:/customer/list.do";
	}
}


















