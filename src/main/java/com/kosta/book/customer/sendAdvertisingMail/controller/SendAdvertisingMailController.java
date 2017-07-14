package com.kosta.book.customer.sendAdvertisingMail.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.book.admin.mCustomer.model.ManageCustomerDAO;
import com.kosta.book.admin.mCustomer.model.ManageCustomerVO;
import com.kosta.book.customer.sendAdvertisingMail.model.SendAdvertisingMailDAO;
import com.kosta.book.customer.sendAdvertisingMail.model.SendAdvertisingMailVO;

@Controller
public class SendAdvertisingMailController {
       
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private SqlSession sqlSession;

	@ResponseBody
	@RequestMapping(value = "/sendAdMail.do")
	public HashMap<String, Object> sendMail(@RequestParam Map<String, Object> map) throws FileNotFoundException, URISyntaxException {
		
		SendAdvertisingMailDAO dao = sqlSession.getMapper(SendAdvertisingMailDAO.class);
		ManageCustomerDAO customerDao = sqlSession.getMapper(ManageCustomerDAO.class);
		List<ManageCustomerVO> customerList = customerDao.selectAll();
		HashMap<String, Object> data = new HashMap<String, Object>();
		try {
			
			String title = (String)map.get("title");
			
			for(int k = 0; k < customerList.size(); k++) {
			MimeMessage message = mailSender.createMimeMessage();
			String mailTitle = "(광고) " + title;
			System.out.println("메일 제목 : " + mailTitle);
			
			
			message.setFrom(new InternetAddress("KostaStarBooks@gmail.com")); // from
			message.addRecipient(RecipientType.TO, new InternetAddress(customerList.get(k).getEmail())); // to
			message.setSubject(mailTitle); // title
			
			List<SendAdvertisingMailVO> list = dao.sendEmailBookList();
			String mailContent = "<html><head></head><body>"
					+ "<center>"
					+ "<textarea style=\"width:900px; height:50px; border: 0;\" readonly=\"readonly\">"
					+ "새로 들어온 책을 만나보세요!"
					+ "</textarea>"
					+ "<table style=\"border-top: 1px solid #cccccc; border-collapse: collapse;\">";
			
			for (int i = 0; i < 3; i++) {
				mailContent = mailContent
						+ "<tr style=\"border-bottom: 1px solid #cccccc;  padding: 10px;\">"
						+ "<td rowspan=\"2\" width=\"324px\" height=\"420px\" style=\"border-bottom: 1px solid #cccccc;  padding: 10px;\">"
						+ list.get(i).getImage()
						+ "</td>"
						+ "<td width=\"576px\" height=\"270\" style=\"border-bottom: 1px solid #cccccc;  padding: 10px;\"><h3>"
						+ list.get(i).getTitle()
						+ "</h3><br>"
						+ "</td>"
						+ "<tr style=\"border-bottom: 1px solid #cccccc;  padding: 10px;\">"
						+ "<td width=\"576px\" height=\"130px\" style=\"border-bottom: 1px solid #cccccc;  padding: 10px;\">"
						+ "가격 : "
						+ list.get(i).getPrice()
						+ "</td>"
						+ "</tr>";
			}
			mailContent = mailContent
					+ "</table>"
					+ "</center>"
					+ "</body>"
					+ "</html>";			
			message.setText(mailContent, "utf-8", "html"); // content
			mailSender.send(message);
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	
	@RequestMapping(value = "/sendAdvertiseMail.do")
	public String mail(HttpServletRequest request){
		return "admin/sendAdvertiseMail";
	}
	
	
	
}