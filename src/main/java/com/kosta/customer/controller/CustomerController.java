package com.kosta.customer.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.customer.model.CustomerVO;
import com.kosta.customer.model.EmailVO;
import com.kosta.customer.service.CustomerService;
import com.kosta.customer.service.EmailSender;

@Controller
public class CustomerController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
								
	@Inject
	CustomerService customerService;
	
	@Inject
	EmailSender emailSender;
	
	EmailVO email;
	CustomerVO customerVO;
	
	@RequestMapping("/customer/login.do")
	public String customerLogin(){
		return "/customer/login";	
	}
	
	@RequestMapping("/customer/loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute CustomerVO vo, HttpSession session){
		boolean result = customerService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true){
	
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
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			
			return "customer/view";
		}
	}
	
	
	//id 중복체크
	

	
	/*checkId
	idCheck*/
	@RequestMapping("/customer/checkId.do")
	public String idCheck(@RequestParam String id, Model model, HttpServletRequest request, CustomerVO vo){
		
			boolean result = customerService.idCheck(id);
			System.out.println("아이디는 : " + id);
			if(result){
					vo.setId(id);
					model.addAttribute("id", id);
					model.addAttribute("message", "아이디는 사용가능합니다.");
					/*return "redirect:/customer/write.do";*/
					
				}else{
					vo.setId(id);
					model.addAttribute("id", id);
					model.addAttribute("message", "아이디는 이미 사용중입니다.");
				
					/*return "customer/write.do";*/
				}
			return "customer/checkId";
	
	}


	
	@RequestMapping("/customer/delete.do")
	public String delete(@RequestParam String id, @RequestParam String pwd, Model model){
		

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
	
	@RequestMapping("/customer/searchPw.do")
	public String SearchPw(){
		return "customer/searchPw";
	}
	
	
	@RequestMapping("/customer/sendpw.do")
	 public String sendEmailAction (@ModelAttribute CustomerVO vo,@ModelAttribute EmailVO email, Model model) throws Exception {
		CustomerVO vo2=customerService.pwdCheck(vo); 
		
       String id=(String)vo.getId();
       String e_mail=(String)vo.getEmail();
       String pwd = vo2.getPwd();
       
       if(pwd!=null) {
           email.setContent("비밀번호는 "+pwd+" 입니다.");
           email.setReceiver(e_mail);
           email.setSubject(id+"님 비밀번호입니다.");
           emailSender.sendEmail(email);
           System.out.println("메일전송");
           model.addAttribute("message","EmailSended");
           return "redirect:/customer/searchPw.do";
      
       }else {
        System.out.println("에러남");
        model.addAttribute("message","EmailFailed");
        return "redirect:/customer/login.do";
	        }
       
	    }

	
}
