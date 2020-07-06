package com.ana.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ana.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
@AllArgsConstructor
public class LoginController {

	@Autowired
	UserService service;
	
	//login 페이지 보여주기
	@RequestMapping("/login")
	public String showLoginPage() {
		return "/user/login";
	}
	
	//로그인 기능하기
	@PostMapping("/executeLogin")
	public void executeLogin(String email, String pwd) {
		log.info(email);
		log.info(pwd);
		//이메일과 비번이 일치하는 지 확인하기
		if(service.isValidUser(email, pwd)) {
			String uNum=service.getUserNumById(email);
			log.info("!!!!USER NUM: "+uNum);
			//일치한다면 userNum으로 세션을 부여하기
			
		}
	}
	
	//findPwd 페이지 보여주기 기능
	@RequestMapping("/findPwd")
	public String findPwd() {
		return "/user/findPwd";
	}
}
