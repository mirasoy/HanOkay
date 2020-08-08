package com.ana.service;

import com.ana.domain.EmailDTO;

public interface EmailService {
	//예약 확정 이메일 발송
    public void sendMail(EmailDTO dto);
    
    //회원가입 시 필요한 인증메일 발송하기
    public boolean sendAuthEmail(String email, String authCode);
}

 