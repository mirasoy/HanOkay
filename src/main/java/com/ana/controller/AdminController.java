package com.ana.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ana.domain.UserVO;
import com.ana.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;






@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	
	@Autowired
	private AdminService aservice;//호스트 사업등록증관련
	
	
	//세션에서 유저이름 가져오는 메서드
	public UserVO getUser(HttpSession session) {
		UserVO user=(UserVO)session.getAttribute("user");
		if(user==null)return null;
		return user;
	}
	
	

	
	///////////////////////
	
	
	@GetMapping("/adminindex")
	public void indexGet(Model model,HttpSession session) {
		System.out.println("adminindex get");
		
		
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
	}
	
	@GetMapping("/userStat")
	public void userStatGet(String userNum,Model model,HttpSession session) {
		//HOST_PENDING인 회원들을 전부 가져온다
		List<UserVO> list=aservice.getPendingHost();
		
		if(list==null) {
			model.addAttribute("size", 0);
			
		} else {
			model.addAttribute("list", list);
			model.addAttribute("size", list.size());
			
		}
				
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		
	}
	
	
	
	@GetMapping("/userStatProc")
	public void userStatProcGet(String userNum,Model model,HttpSession session) {
		System.out.println("userStatProc Get");
		UserVO user=aservice.getUser(userNum);
		
		model.addAttribute("user", user);
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		
	}
	
	@PostMapping("/userStatProc")
	public String userStatProcPost(String userNum,Model model,HttpSession session) {
		System.out.println("userStatProc Post");
		
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		return "/admin/userStatProc";
	}
	
	@GetMapping("/moditoHost")//페이지 자체는 없음
	public void moditoHostGet() {
		System.out.println("moditoHost Get");
	}
	
	
	
	@PostMapping("/moditoHost")
	public String moditoHostPost(String userNum,Model model,HttpSession session) {
		System.out.println("moditoHost Post");
		aservice.moditoHost(userNum);
		
		
		//알림 보내기 기능추가할것 나중에
		
		return "redirect:/admin/adminindex";
	}
	
	@GetMapping("/moditoGuest")//페이지 자체는 없음
	public void moditoGuestGet() {
		System.out.println("moditoGuest Get");
	}
	
	
	
	@PostMapping("/moditoGuest")
	public String moditoGuestPost(String userNum,Model model,HttpSession session) {
		System.out.println("moditoGuest Post");
		
		//guest, active, 사업자번호 리셋
		aservice.moditoGuest(userNum);
		
		//알림 보내기 기능추가할것 나중에
		
		return "redirect:/admin/adminindex";
	}
}