package com.ana.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ana.domain.ChatRomVO;
import com.ana.domain.MsgVO;
import com.ana.domain.UserVO;
import com.ana.service.ChatRomService;
import com.ana.service.MsgService;
import com.ana.service.RevService;
import com.ana.service.UserService;

import lombok.extern.log4j.Log4j;



@Controller
@Log4j
@RequestMapping("/recommend/*")
public class RecommendController {
	private UserVO user;
	private String userNum;
	
	@GetMapping("/list2")
	public void testPage() {
		
	}

	
		

}