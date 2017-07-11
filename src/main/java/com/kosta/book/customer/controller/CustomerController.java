package com.kosta.book.customer.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.customer.model.CustomerVO;
import com.kosta.book.customer.service.CustomerService;

@Controller
public class CustomerController {
	
	@Inject
	CustomerService customerService;
	
	@RequestMapping("/starBooks.do")
	public ModelAndView testmain(HttpServletRequest request, HttpSession session, CustomerVO vo){
		String cmd = request.getParameter("cmd");
		ModelAndView mav = new ModelAndView();
		System.out.println("cmd : " + cmd);
		switch(cmd){
		case "login" :
			mav = login();
			break;
		case "logout" :
			mav = logout(session);
			break;
		case "main" :
			mav = main(vo, session, request);
			break;
		case "join" :
			mav = join(vo);
			break;
		case "myPage" :
			mav = myPage(session, request);
			break;
		case "modify" :
			mav = modify(vo);
			break;
		}
		return mav;
	}// main controller
	
	
	public ModelAndView login(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/login");
		return mav;	
	}
	

	public ModelAndView logout(HttpSession session){
		customerService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/login");
		mav.addObject("message", "logout");
		
		return mav;
	}
	
	public ModelAndView main(CustomerVO vo, HttpSession session, HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Object id = session.getAttribute("id");
		
		if(id!=null){
			mav.setViewName("mainPage");
			return mav;
		}
		
		if(vo.getId()!=null){
			boolean result = customerService.loginCheck(vo, session);
			
			if(result == true){
				mav.setViewName("mainPage");
			}else{
				mav.setViewName("customer/login");
				mav.addObject("message", "error");
			}
			return mav;
		}
			
		mav.setViewName("mainPage");
		
		return mav;	
	}
	
	public ModelAndView join(CustomerVO vo){
		ModelAndView mav = new ModelAndView();
		if(vo.getId()==null){
			mav.setViewName("customer/join");
			return mav;	
		}else{
			vo.setCustomerClass("silver");
			customerService.insertCustomer(vo);
			mav.setViewName("customer/login");
		}
		return mav;
	}
	
	public ModelAndView myPage(HttpSession session, HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
			mav.addObject("myPageError", "error");
			mav.setViewName("mainPage");
			return mav;
		}
		
		if(request.getParameter("error")!=null){	//정보수정 암호가 틀렸을시
			mav.addObject("error", request.getParameter("error")); 
		}
		
		mav.addObject("customer", customerService.viewCustomer(id));
		mav.setViewName("customer/myPage");
		
		return mav;
	}
	
	public ModelAndView modify(CustomerVO vo){
		ModelAndView mav = new ModelAndView();
		boolean result = customerService.checkPwd(vo.getId(), vo.getPwd());
		
		if(result){
			String c_class = customerService.getClass(vo);
			vo.setCustomerClass(c_class);
			
			customerService.updateCustomer(vo);
			mav.setViewName("redirect:starBooks.do?cmd=myPage");
			return mav;
		}else{
			mav.setViewName("redirect:starBooks.do?cmd=myPage&error=pwd");
			return mav;
		}
	}
	
	@RequestMapping("/delete.do")
	public String delete(@RequestParam String id, @RequestParam String pwd, Model model){
	
				boolean result = customerService.checkPwd(id, pwd);
				if(result){
					customerService.deleteCustomer(id);
					return "redirect:list.do";
					
				}else{
					model.addAttribute("message", "삭제 성공");
					model.addAttribute("dto", customerService.viewCustomer(id));
					return "customer/view";
				}
		
	}
}

/*@RequestMapping("/list.do")
public String customerList(Model model){
	List<CustomerVO> list =  customerService.customerList();
	model.addAttribute("list", list);
	return "customer/customerList";
}*/

/*@RequestMapping("/customer/write.do")
public String write(){
	return "customer/write"; 
}*/