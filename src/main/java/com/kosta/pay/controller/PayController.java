package com.kosta.pay.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.book.admin.mSales.model.SalesListVO;
import com.kosta.cart.model.CartVO;
import com.kosta.pay.model.GetDeliveryVO;
import com.kosta.pay.model.GetDirectVO;
import com.kosta.pay.model.PayDAO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;


@Controller
public class PayController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("pay/deliverPayment.do")
	@ResponseBody
	public HashMap<String, Object> complete(@RequestParam Map<String, String> map) {
		
		System.out.println("pay/deliverPayment.do");
		HashMap<String, Object> data = new HashMap<String, Object>();
		String imp_uid = map.get("imp_uid");
		String api_key = "imp_apikey";
		String api_secret = "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f";
		
		IamportClient iClient = new IamportClient(api_key, api_secret);
		IamportResponse<Payment> payment_response = iClient.paymentByImpUid(imp_uid);
		Payment payment = payment_response.getResponse();
		System.out.println(payment.getAmount());
		System.out.println(payment.getMerchantUid());

		data.put("rsp", payment_response.getResponse());
		data.put("everythings_fine", true);
		return data;
	}
	
	@RequestMapping("pay/directPayment.do")
	@ResponseBody
	public HashMap<String, Object> directPayment(@RequestParam Map<String, String> map) {
		
		System.out.println("pay/directPayment.do");
		HashMap<String, Object> data = new HashMap<String, Object>();
		String imp_uid = map.get("imp_uid");
		String api_key = "imp_apikey";
		String api_secret = "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f";
		
		IamportClient iClient = new IamportClient(api_key, api_secret);
		IamportResponse<Payment> payment_response = iClient.paymentByImpUid(imp_uid);
		Payment payment = payment_response.getResponse();
		System.out.println(payment.getAmount());
		System.out.println(payment.getMerchantUid());

		data.put("rsp", payment_response.getResponse());
		data.put("everythings_fine", true);
		return data;
	}
	
	@RequestMapping("pay/deliveryInsert.do")
	public String deliveryComplete(String zipcode, String address1, String address2, String phone, String name, String id) {
		System.out.println("pay/deliveryInsert.do");
		PayDAO dao = sqlSession.getMapper(PayDAO.class);
		GetDeliveryVO vo = new GetDeliveryVO();
		vo.setAddress1(address1);
		vo.setAddress2(address2);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setZipcode(zipcode);
		System.out.println(id);
		List orderno = dao.getOrderNo(id);
		System.out.println((Integer)orderno.get(0));
		vo.setOrderno((Integer)orderno.get(0));
		
		dao.insertGetDelivery(vo);
		
		return "";
	}
	
	@RequestMapping("pay/saleInsert.do")
	@ResponseBody
	public String processSale(String id, String title, String dPrice, String isbn, String branchName, String quantity, String cartno) {
		
		System.out.println("pay/saleInsert.do");
		SalesListVO vo = new SalesListVO();
		CartVO cart = new CartVO();
		vo.setId(id);
		vo.setTitle(title);
		vo.setdPrice(Integer.parseInt(dPrice));
		vo.setIsbn(isbn);
		vo.setBranchName(branchName);
		vo.setQuantity(Integer.parseInt(quantity));
		
		cart.setIsbn(isbn);
		cart.setAmount(Integer.parseInt(quantity));
		cart.setId(id);
		cart.setCartno(Integer.parseInt(cartno));
		
		System.out.println(vo.toString());
		PayDAO dao = sqlSession.getMapper(PayDAO.class);
		dao.insertSaleList(vo);
		dao.updateDelivery(cart);
		dao.minusOnlineInventory(cart);
		
		return "complete";
		
	}
	
	@RequestMapping("pay/insertGetPay.do")
	@ResponseBody
	public String insertGetPay(String id, String title, String date, String dPrice, String isbn, String branch, String quantity, String cartno) throws ParseException {
		
		System.out.println("pay/insertGetPay.do");
		GetDirectVO vo = new GetDirectVO();
		CartVO cart = new CartVO();
		SalesListVO sale = new SalesListVO();
		PayDAO dao = sqlSession.getMapper(PayDAO.class);
		
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		Date getDate = form.parse(date);
		System.out.println(getDate);
		
		vo.setBranch(branch);
		vo.setId(id);
		vo.setIsbn(isbn);
		vo.setIsPaid(0);
		vo.setQuantity(Integer.parseInt(quantity));
		vo.setTitle(title);
		vo.setGetDate(getDate);
		

		cart.setId(id);
		cart.setCartno(Integer.parseInt(cartno));
		
		sale.setBranchName(branch);
		sale.setdPrice(Integer.parseInt(dPrice));
		sale.setId(id);
		sale.setIsbn(isbn);
		sale.setQuantity(Integer.parseInt(quantity));
		sale.setTitle(title);
		
		dao.insertSaleList(sale);
		
		List orderno = dao.getOrderNo(id);
		
		vo.setOrderno((int) orderno.get(0));
		
		dao.insertGetPay(vo);
		dao.updateGetDirect(cart);
		
		return "complete";
		
	}
	
	@RequestMapping("pay/insertNowPay.do")
	@ResponseBody
	public String insertNowPay(String id, String title, String date, String dPrice, String isbn, String branch, String quantity, String cartno) throws ParseException {
		
		System.out.println("pay/insertGetPay.do");
		GetDirectVO vo = new GetDirectVO();
		CartVO cart = new CartVO();
		SalesListVO sale = new SalesListVO();
		PayDAO dao = sqlSession.getMapper(PayDAO.class);
		
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		Date getDate = form.parse(date);
		System.out.println(getDate);
		
		vo.setBranch(branch);
		vo.setId(id);
		vo.setIsbn(isbn);
		vo.setIsPaid(0);
		vo.setQuantity(Integer.parseInt(quantity));
		vo.setTitle(title);
		vo.setGetDate(getDate);
		

		cart.setId(id);
		cart.setCartno(Integer.parseInt(cartno));
		
		sale.setBranchName(branch);
		sale.setdPrice(Integer.parseInt(dPrice));
		sale.setId(id);
		sale.setIsbn(isbn);
		sale.setQuantity(Integer.parseInt(quantity));
		sale.setTitle(title);
		
		dao.insertSaleList(sale);
		
		List orderno = dao.getOrderNo(id);
		
		vo.setOrderno((int) orderno.get(0));
		
		dao.insertNowPay(vo);;
		dao.updateGetDirect(cart);
		
		return "complete";
	}
	
	
	
}
