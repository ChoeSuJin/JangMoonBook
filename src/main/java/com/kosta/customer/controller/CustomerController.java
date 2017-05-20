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
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
								// CustomerController 클래스에 있는 Logger를 수집하겠다.
	@Inject
	CustomerService customerService;
	
	//로그인페이지로 이동
	@RequestMapping("/customer/login.do")
	public String customerLogin(){
		return "customer/login";	
	}
	
	//로그인성공 - 메인페이지
	@RequestMapping("/customer/loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute CustomerVO vo, HttpSession session){
		boolean result = customerService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true){
			//로그인 성공
			mav.setViewName("customer/main");
			mav.addObject("message", "success");
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
	public String update(@ModelAttribute CustomerVO vo, Model model){
		//비밀번호 체크
		boolean result = customerService.checkPwd(vo.getId(), vo.getPwd());
		if(result){
			customerService.updateCustomer(vo);
			return "redirect:/customer/list.do";
		}else{
			//회원등급 날라감 방지
			CustomerVO vo2 = customerService.viewCustomer(vo.getId());
			vo.setCustomerClass(vo2.getCustomerClass());
			
			model.addAttribute("dto", vo);
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "customer/view";
		}
	
		
	}
	
	@RequestMapping("/customer/delete.do")
	public String delete(@RequestParam String id, @RequestParam String pwd, Model model){
		
		//비밀번호 체크
				boolean result = customerService.checkPwd(id, pwd);
				if(result){
					customerService.deleteCustomer(id);
					return "redirect:/customer/list.do";
					
				}else{
					model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
					model.addAttribute("dto", customerService.viewCustomer(id));
					return "customer/view";
				}
		
	}
}


















