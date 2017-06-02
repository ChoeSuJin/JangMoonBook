package com.kosta.pay.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.pay.model.PayVO;
import com.kosta.pay.service.PayService;

@Controller
@RequestMapping("/pay/")
public class PayController {

	@Inject
	PayService payService;
	
	@RequestMapping("orderForm.do")
	public String orderForm(){
		
		return "pay/orderForm";
	}
	
	@RequestMapping("orderview.do")
	public ModelAndView insert(@ModelAttribute PayVO vo, @RequestParam int orderno) throws Exception{
		payService.insert(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pay/orderview");
		mav.addObject("list", payService.view(orderno));		
		return mav;
	}
}
