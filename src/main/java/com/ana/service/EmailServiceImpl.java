package com.ana.service;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import com.ana.domain.EmailDTO;
import com.ana.mapper.UserMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service // 서비스 빈으로 등록
public class EmailServiceImpl implements EmailService {
 
    @Inject
    JavaMailSender mailSender; // root-context.xml에 설정한 bean, 의존성을 주입
 
   // private UserMapper mapper;
    
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
            
          //setText에 booking에 정보를 담아서 준다.
            //
 
//            msg.setText(dto.getBookingVO().toString(), "utf-8");
 
            // 이메일 보내기
            mailSender.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //회원 가입을 위한 인증코들르 발송할 이메일을 매개변수로 받아오고 난수를 생성하고 이메일과 난수를 쿠키에 저장한다
	@Override
	public boolean sendAuthEmail(String email, String authCode) {
	    
	    	try {
	    	// 이메일 객체
            MimeMessage msg = mailSender.createMimeMessage();
           
            // 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
            msg.addRecipient(RecipientType.TO, new InternetAddress(email));
 
            // 보내는 사람(이메일주소+이름)
            // (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
            // 이메일 발신자
            msg.addFrom(new InternetAddress[] { new InternetAddress("tmpProjAna@gmail.com", "HanOkay 한오케이") });
 
            // 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
            msg.setSubject("HanOkay 한오케이 서비스 회원가입 인증코드", "utf-8");
            // 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
            msg.setText("안녕하세요 HanOkay 한오케이 서비스팀입니다. \n 저희 회원이 되기위한 인증 코드는 '"+ authCode + "' 입니다. \n 인증 코드를 입력한 후, '인증코드 확인'버튼을 누르세요."
           ,"utf-8");
            // 이메일 보내기
            mailSender.send(msg);
        } 
	    	catch (Exception e) {
            e.printStackTrace();
            return false;
        }
	    return true;
	}

 
}