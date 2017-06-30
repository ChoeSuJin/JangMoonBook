package com.kosta.customer.service;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kosta.customer.model.EmailVO;
   
@Service
public class EmailSender  {
     
    @Inject
    protected JavaMailSender mailSender;	
    
    public void sendEmail(EmailVO email) throws Exception {
        
        try {
        	MimeMessage msg = mailSender.createMimeMessage();
            msg.setSubject(email.getSubject(), "UTF-8");	
            msg.setText(email.getContent(), "UTF-8");	
            /*msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));*/
           
            msg.addRecipient(MimeMessage.RecipientType.TO
					, new InternetAddress(email.getReceiver()));	
            
            mailSender.send(msg);	
        }catch(MessagingException e) {
            System.out.println("메일발송 실패");
            e.printStackTrace();
        }
       
    }
}