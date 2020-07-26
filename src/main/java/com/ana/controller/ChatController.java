package com.ana.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ana.domain.UserVO;

@Controller
public class ChatController {
	private UserVO user;
	private String userNum;

	@RequestMapping(value = "chat/chattingView",  method = RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv, HttpSession session) {
		user = (UserVO) session.getAttribute("user");
		
		if(user!=null) {
		System.out.println("<D<D<F>D<D>D<D>"+user.getUserEmail());
		
		mv.setViewName("chat/chattingView");
		mv.addObject("Userid",user.getUserEmail());
		}else {
			mv.setViewName("acm/list");
		}
		return mv;
	}
}
