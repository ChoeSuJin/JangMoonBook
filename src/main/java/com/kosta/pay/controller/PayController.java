package com.kosta.pay.controller;

import java.io.UnsupportedEncodingException;
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
import com.kosta.customer.model.CustomerVO;
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
	
	// 배송결제를 처리하는 메소드
	// ajax로 전달되어 처리
	@RequestMapping("pay/deliverPayment.do")
	@ResponseBody
	public HashMap<String, Object> complete(@RequestParam Map<String, String> map) {
		
		
		// Iamport에서 제공하는 비밀키와 키를 이용하여 결제여부를 확인
		// 결제가 성공하면 ajax 메소드에서 success를 수행
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

		// 결제정보와 제대로 되었다는 메세지를 함께 보냄
		data.put("rsp", payment_response.getResponse());
		data.put("everythings_fine", true);
		return data;
	}
	
	// 직접 수령을 처리하는 메소드
	// ajax로 전달되어 처리
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
	
	// Ebook 결제를 처리하는 메소드
	// ajax로 전달되어 처리
	@RequestMapping("pay/ebookPayment.do")
	@ResponseBody
	public HashMap<String, Object> ebookPayment(@RequestParam Map<String, String> map) {
		
		System.out.println("pay/ebookPayment.do");
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
	
	// 배송목록에 추가하는 메소드
	// ajax로 전달되어 처리
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
	
	// 판매 목록에 추가하는 메소드
	// 등급재조정에 관한 메소드가 들어있다
	// ajax로 전달되어 처리
	@RequestMapping(value="pay/saleInsert.do", produces="application/text; charset=utf8")	// Web Notification을 이용하기때문에 UTF-8로 인코딩 필요
	@ResponseBody
	public String processSale(String id, String title, String dPrice, String isbn, String branchName, String quantity, String cartno) throws UnsupportedEncodingException {
		
		System.out.println("pay/saleInsert.do");
		SalesListVO vo = new SalesListVO();
		CartVO cart = new CartVO();
		vo.setId(id);
		vo.setTitle(title);
		vo.setdPrice((int)Math.round(Double.valueOf(dPrice)));
		vo.setIsbn(isbn);
		vo.setBranchName(branchName);
		vo.setQuantity(Integer.parseInt(quantity));
		
		cart.setIsbn(isbn);
		cart.setAmount(Integer.parseInt(quantity));
		cart.setId(id);
		cart.setCartno(Integer.parseInt(cartno));
		
		// 판매목록에 insert -> 장바구니를 배송상태로 업데이트 -> 재고 차감
		System.out.println(vo.toString());
		PayDAO dao = sqlSession.getMapper(PayDAO.class);
		dao.insertSaleList(vo);
		dao.updateDelivery(cart);
		dao.minusOnlineInventory(cart);
		
		// 등급 재조정
		CustomerVO customer = dao.getCustomerInfo(id);
		int sum6Month = dao.sum6MonthSale(id);
		String newClass;
		if (sum6Month < 50000)
			newClass = "silver";
		else if (sum6Month >= 50000 && sum6Month < 200000)
			newClass = "gold";
		else
			newClass = "platinum";
		System.out.println("newClass = " + newClass);
		System.out.println(customer.getCustomerClass());
		if (!customer.getCustomerClass().equals(newClass)) {
			dao.updateCustomerClass(id, newClass);
			String msg = id + "님의 등급이" + newClass + "로 변경되었습니다.";
			return msg;
		}
		else
			return "";
		
	}
	
	// 직접 수령 테이블에 추가하는 메소드
	// ajax로 전달되어 처리
	@RequestMapping("pay/insertGetPay.do")
	@ResponseBody
	public void insertGetPay(String id, String title, String date, String dPrice, String isbn, String branch, String quantity, String cartno) throws ParseException {
		
		System.out.println("pay/insertGetPay.do");
		GetDirectVO vo = new GetDirectVO();
		CartVO cart = new CartVO();
		SalesListVO sale = new SalesListVO();
		PayDAO dao = sqlSession.getMapper(PayDAO.class);
		
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		Date getDate = form.parse(date);
		System.out.println(getDate);
		System.out.println(dPrice);
		
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
		sale.setdPrice((int)Math.round(Double.valueOf(dPrice)));
		sale.setId(id);
		sale.setIsbn(isbn);
		sale.setQuantity(Integer.parseInt(quantity));
		sale.setTitle(title);
		
		// 판매목록에 추가 -> 직접수령 목록에 추가 -> 장바구니에 직접수령으로 업데이트
		dao.insertSaleList(sale);
		
		List orderno = dao.getOrderNo(id);
		
		vo.setOrderno((int) orderno.get(0));
		
		dao.insertGetPay(vo);
		dao.updateGetDirect(cart);
		
		
		
		
	}
	
	// 결제후 수령을 처리하는 메소드
	// ajax로 전달되어 처리
	@RequestMapping(value="pay/insertNowPay.do", produces="application/text; charset=utf8")
	@ResponseBody
	public String insertNowPay(String id, String title, String date, String dPrice, String isbn, String branch, String quantity, String cartno) throws ParseException {
		
		System.out.println("pay/insertNowPay.do");
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
		sale.setdPrice((int)Math.round(Double.valueOf(dPrice)));
		sale.setId(id);
		sale.setIsbn(isbn);
		sale.setQuantity(Integer.parseInt(quantity));
		sale.setTitle(title);
		
		// 판매 목록에 추가 -> 직접수령 목록에 추가 -> 장바구니 상태를 직접수령으로 변경
		dao.insertSaleList(sale);
		
		List orderno = dao.getOrderNo(id);
		
		vo.setOrderno((int) orderno.get(0));
		
		dao.insertNowPay(vo);;
		dao.updateGetDirect(cart);
		
		// 등급 재조정
		CustomerVO customer = dao.getCustomerInfo(id);
		int sum6Month = dao.sum6MonthSale(id);
		String newClass;
		if (sum6Month < 50000)
			newClass = "silver";
		else if (sum6Month >= 50000 && sum6Month < 200000)
			newClass = "gold";
		else
			newClass = "platinum";
		System.out.println("newClass = " + newClass);
		System.out.println(customer.getCustomerClass());
		if (!customer.getCustomerClass().equals(newClass)) {
			dao.updateCustomerClass(id, newClass);
			String msg = id + "님의 등급이" + newClass + "로 변경되었습니다.";
			return msg;
		}
		else
			return "";
		
	}
	
	
	
}
