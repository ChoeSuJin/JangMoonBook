package com.kosta.book.customer.sendAdvertisingMail.controller;
import java.io.FileNotFoundException;
import java.net.URISyntaxException;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class SendAdvertisingMailController {
       
	@Autowired
	private JavaMailSender mailSender; // xml�� ����� bean autowired
	
	//String from, String to, String subject, String text, String formUrl
	@RequestMapping(value = "/sendAdMail.do")
	public String sendMail() throws FileNotFoundException, URISyntaxException {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			
			message.setFrom(new InternetAddress("g5hn_2d_ck@naver.com")); // �����»��
			message.addRecipient(RecipientType.TO, new InternetAddress("g5nh_2d_ck@naver.com")); // �޴»��
			message.setSubject("�����Դϴ�"); // ����
			message.setText("<h1>�����Դϴ�</h1><br>�����Դϴ�", "utf-8", "html"); // ����
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:starBooks.do?cmd=main";
	}
}