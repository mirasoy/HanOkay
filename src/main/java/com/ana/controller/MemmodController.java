package com.ana.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ana.domain.UserVO;
import com.ana.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/memmod/*")
@AllArgsConstructor
public class MemmodController {
	@Autowired
	private UserService uservice;//회원계정이나 프로필을 연동한다
	
	
	//세션에서 유저이름 가져오는 메서드
	public UserVO getUser(HttpSession session) {
		UserVO user=(UserVO)session.getAttribute("user");
		if(user==null)return null;
		return user;
	}
	
	
	@GetMapping("/profile")//프로필화면 띄우기
	public void profileGet(Model model,HttpSession session) {
		//model.addAttribute("userFstname", getUser(session).getUserFstName());
	}
	
	@GetMapping("/account")//계정화면 띄우기
	public void accountGet(Model model,HttpSession session) {
		//model.addAttribute("userFstname", getUser(session).getUserFstName());
	}
	
	
}
