package com.kosta.customer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.customer.model.BookVO;
import com.kosta.customer.model.CustomerVO;
import com.kosta.customer.model.EmailVO;
import com.kosta.customer.service.CustomerService;
import com.kosta.customer.service.EmailSender;

@Controller
public class CustomerController {
	
	@Inject
	CustomerService customerService;
	
	@Inject
	EmailSender emailSender;
	
	EmailVO email;
	CustomerVO customerVO;
	
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
		case "searchPwd" :
			mav = SearchPw();
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
		List<BookVO> bsetlist = customerService.bestSeller();
		List<BookVO> newlist = customerService.newBook();
		
		if(id!=null){
			mav.addObject("bestSeller", bsetlist);
			mav.addObject("newBook", newlist);
			mav.setViewName("mainPage");
			return mav;
		}
		
		if(vo.getId()!=null){
			boolean result = customerService.loginCheck(vo, session);
			
			if(result == true){
				mav.addObject("bestSeller", bsetlist);
				mav.addObject("newBook", newlist);
				mav.setViewName("mainPage");
			}else{
				mav.setViewName("customer/login");
				mav.addObject("message", "error");
			}
			return mav;
		}
		
		mav.addObject("bestSeller", bsetlist);
		mav.addObject("newBook", newlist);
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
		
		if(request.getParameter("error")!=null){	
			mav.addObject("error", request.getParameter("error")); 
		}
		
		mav.addObject("myEbook",customerService.myEbook(id));
		mav.addObject("purchase",customerService.saleList(id));
		mav.addObject("customer", customerService.viewCustomer(id));
		mav.setViewName("customer/myPage");
		
		return mav;
	}
	
	@RequestMapping("/checkPwd.do")
	public @ResponseBody HashMap<String, Object> checkPwd(@RequestParam Map<String, String> map) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		CustomerVO vo = new CustomerVO();
		
		System.out.println(map.get("id"));
		System.out.println(map.get("pwd"));
		vo.setId(map.get("id"));  vo.setPwd(map.get("pwd"));
		
		int result = customerService.checkPwdMypage(vo);
		System.out.println("result : " + result);
		
		data.put("result", result);
		
		return data;
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
					model.addAttribute("message", "dd");
					model.addAttribute("dto", customerService.viewCustomer(id));
					return "customer/view";
				}
		
	}
	
	/*비밀번호 찾기 관련 메소드*/
	
	public ModelAndView SearchPw(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/searchPw");
		return mav;
	}
	
	
	@RequestMapping("sendpw.do")
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
           return "redirect:/starBooks.do?cmd=main";
      
       }else {
        System.out.println("에러남");
        return "redirect:starBooks.do?cmd=login";
	        }
       
	    }

	
}
