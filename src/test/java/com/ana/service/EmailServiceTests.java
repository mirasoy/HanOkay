package com.ana.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.EmailDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class EmailServiceTests {

	@Setter(onMethod_= {@Autowired })
	private EmailService service;	
	
//	@Test
	public void testSendEmail1() {
		EmailDTO dto= new EmailDTO();
		dto.setSenderMail("tmpProjAna@gmail.com");
		dto.setReceiveMail("serin9811@gmail.com");
		dto.setSubject("Ana 서비스 테스트 메일");
		dto.setMessage("본문: ana 서비스 테스트 메일");
		dto.setSenderName("ANA 프로젝트");
		service.sendMail(dto);
	}
	
	@Test
	public void testSendEmail2() {
		service.sendAuthEmail("serin9811@naver.com"); //이메일 주소만으로 미리 지정해준 내용을 보낼 수 있는 메서드
	}
}
