package com.kosta.book.customer.sendAdvertisingMail.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.kosta.book.customer.sendAdvertisingMail.model.SendAdvertisingMailDAO;
import com.kosta.book.customer.sendAdvertisingMail.model.SendAdvertisingMailVO;

import sun.net.www.protocol.mailto.MailToURLConnection;
 
@Controller
public class SendAdvertisingMailController {
       
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/sendAdMail.do")
	public String sendMail(HttpServletRequest request) throws FileNotFoundException, URISyntaxException {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			String mailTitle = request.getParameter("title");
			System.out.println("메일 제목 : " + mailTitle);
			
			
			message.setFrom(new InternetAddress("g5hn_2d_ck@naver.com")); // from
			message.addRecipient(RecipientType.TO, new InternetAddress("g5hn_2d_ck@naver.com")); // to
			message.setSubject(mailTitle); // title
			
			SendAdvertisingMailDAO dao = sqlSession.getMapper(SendAdvertisingMailDAO.class);
			List<SendAdvertisingMailVO> list = dao.sendEmailBookList();
			String mailContent = "한국도서 링크 / 외국도서 링크 / E-book 링크<br>";
			
			for (int i = 0; i < 3; i++) {
				mailContent = mailContent
						+ "<a href=https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query="
						+list.get(i).getTitle()
						+">"
						+list.get(i).getTitle()
						+"<a><br>";
			}
			mailContent = mailContent+"밑부분";
			
			message.setText(mailContent, "utf-8", "html"); // content
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:mail.do";
	}
	
	@RequestMapping(value = "/mail.do")
	public String mail(HttpServletRequest request){
		return "sendAdvertisingMail/mailTest";
	}
	
}