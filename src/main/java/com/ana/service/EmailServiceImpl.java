package com.ana.service;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.ana.domain.EmailDTO;
 

 
@Service // 서비스 빈으로 등록
public class EmailServiceImpl implements EmailService {
 
    @Inject
    JavaMailSender mailSender; // root-context.xml에 설정한 bean, 의존성을 주입
 
    @Override
    public void sendMail(EmailDTO dto) {
        try {
            // 이메일 객체
            MimeMessage msg = mailSender.createMimeMessage();
 
            // 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
            msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
  
 
            // 보내는 사람(이메일주소+이름)
            // (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
            // 이메일 발신자
            msg.addFrom(new InternetAddress[] { new InternetAddress(dto.getSenderMail(), dto.getSenderName()) });
 
            // 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
            msg.setSubject(dto.getSubject(), "utf-8");
            // 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
            msg.setText(dto.getMessage(), "utf-8");
 

 
            // 이메일 보내기
            mailSender.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}