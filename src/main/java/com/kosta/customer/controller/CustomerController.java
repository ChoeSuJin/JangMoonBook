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
								// CustomerController �겢�옒�뒪�뿉 �엳�뒗 Logger瑜� �닔吏묓븯寃좊떎.
	@Inject
	CustomerService customerService;
	
	//濡쒓렇�씤�럹�씠吏�濡� �씠�룞
	@RequestMapping("/customer/login.do")
	public String customerLogin(){
		return "/customer/login";	
	}
	
	//濡쒓렇�씤�꽦怨� - 硫붿씤�럹�씠吏�
	@RequestMapping("/customer/loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute CustomerVO vo, HttpSession session){
		boolean result = customerService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true){
			//濡쒓렇�씤 �꽦怨�
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
		
		return "customer/write"; //�솕硫닿��엯�뤌�쑝濡� �씠�룞
	}
	
	// insert 泥섎━
	@RequestMapping("/customer/insert.do")
	public String insert(@ModelAttribute CustomerVO vo){	// CustomerVO 留ㅺ컻蹂��닔濡� 諛쏆쑝硫�, vo�뿉 媛믪씠 �뙎�엫
		vo.setCustomerClass("silver");
		customerService.insertCustomer(vo);
		return "redirect:/customer/list.do";
	}
	
	@RequestMapping("/customer/view.do")
	public String view(String id, Model model){
		logger.info("�겢由��븳 �븘�씠�뵒 : "+id);
		
		model.addAttribute("dto", customerService.viewCustomer(id));		
		return "customer/view";
	}
	
	@RequestMapping("/customer/update.do")
	public String update(@ModelAttribute CustomerVO vo, Model model){
		//鍮꾨�踰덊샇 泥댄겕
		boolean result = customerService.checkPwd(vo.getId(), vo.getPwd());
		if(result){
			customerService.updateCustomer(vo);
			return "redirect:/customer/list.do";
		}else{
			//�쉶�썝�벑湲� �궇�씪媛� 諛⑹�
			CustomerVO vo2 = customerService.viewCustomer(vo.getId());
			vo.setCustomerClass(vo2.getCustomerClass());
			
			model.addAttribute("dto", vo);
			model.addAttribute("message", "鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�뒿�땲�떎.");
			return "customer/view";
		}
	
		
	}
	
	@RequestMapping("/customer/delete.do")
	public String delete(@RequestParam String id, @RequestParam String pwd, Model model){
		
		//鍮꾨�踰덊샇 泥댄겕
				boolean result = customerService.checkPwd(id, pwd);
				if(result){
					customerService.deleteCustomer(id);
					return "redirect:/customer/list.do";
					
				}else{
					model.addAttribute("message", "鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�뒿�땲�떎.");
					model.addAttribute("dto", customerService.viewCustomer(id));
					return "customer/view";
				}
		
	}
}
