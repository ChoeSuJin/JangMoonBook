package com.kosta.customer.service;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kosta.customer.model.EmailVO;
   
@Service
public class EmailSender  {
     
    @Inject
    protected JavaMailSender mailSender;	//메일 발송 객체
    
    public void sendEmail(EmailVO email) throws Exception {
        
        try {
        	MimeMessage msg = mailSender.createMimeMessage();
            msg.setSubject(email.getSubject(), "UTF-8");	//제목
            msg.setText(email.getContent(), "UTF-8");	// 메일 내용
            /*msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));*/
           
            msg.addRecipient(MimeMessage.RecipientType.TO
					, new InternetAddress(email.getReceiver()));	//메일 수신자
            
            mailSender.send(msg);	//메일 전송
        }catch(MessagingException e) {
            System.out.println("메일발송 실패");
            e.printStackTrace();
        }
       
    }
}