package com.ana.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ana.domain.AcmVO;
import com.ana.domain.RomVO;
import com.ana.domain.UserAcmVO;
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
		System.out.println("=== 어드민단 회원보기 페이지!===");
		
		//ACTIVE,HOST_PENDING,HOST인 회원들을 전부 가져온다

		String userStat;
		int size=0;
			
			
		userStat="ACTIVE";
		List<UserVO> activelist= aservice.getadminListUsers(userStat);
		model.addAttribute("activelist", activelist);
		size+=activelist.size();
		
		userStat="Ho_PENDING";
		List<UserVO> hopendinglist= aservice.getadminListUsers(userStat);
		model.addAttribute("hopendinglist", hopendinglist);
		size+=hopendinglist.size();
		
		userStat="HO_ACTIVE";
		List<UserVO> hoactivelist= aservice.getadminListUsers(userStat);
		model.addAttribute("hoactivelist", hoactivelist);
		size+=hoactivelist.size();
			
		
		
		System.out.println("전체리스트갯수:"+size);
		model.addAttribute("size", size);
		model.addAttribute("userFstname", getUser(session).getUserFstName());
	
	}
	
	
	
	@GetMapping("/userStatPendingProc")
	public void userStatPendingProcGet(String userNum,Model model,HttpSession session) {
		System.out.println("userStatPendingProc Get");
		UserVO user=aservice.getUser(userNum);//유저 정보 뿌린다
		
		model.addAttribute("user", user);
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		
	}
	
	@PostMapping("/userStatPendingProc")
	public String userStatPendingProcPost(String userNum,Model model,HttpSession session) {
		System.out.println("userStatPendingProc Post");
		
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		return "/admin/userStatPendingProc";
	}
	
	@GetMapping("/userStathostProc")
	public void userStathostProcGet(String userNum,Model model,HttpSession session) {
		System.out.println("userStathostProc Get");
		UserVO user=aservice.getUser(userNum);//유저 정보 뿌린다
		
		model.addAttribute("user", user);
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		
	}
	
	//@PostMapping("/userStathostProc")
	public String userStathostProcPost(String userNum,Model model,HttpSession session) {
		System.out.println("userStathostProc Post");
		
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		return "/admin/userStathostProc";
	}
	
	@GetMapping("/userStatguestProc")
	public void userStatguestProcGet(String userNum,Model model,HttpSession session) {
		System.out.println("userStatguestProctProc Get");
		UserVO user=aservice.getUser(userNum);//유저 정보 뿌린다
		
		model.addAttribute("user", user);
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		
	}
	
	//@PostMapping("/userStatguestProc")
	public String userStatguestProcPost(String userNum,Model model,HttpSession session) {
		System.out.println("userStatguestProc Post");
		
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		return "/admin/userStatguestProc";
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
	
	@PostMapping("/adminlistings")
	public String adminlistingsPost() {
		return "/admin/adminlistings";
	}
	

	
	@GetMapping("/adminlistings")
	public void adminlistingsGet(Model model,HttpSession session) {
		System.out.println("=== 어드민단 숙소보기 페이지!===");
		
		String acmActi;
		int size=0;

			
			
		acmActi="PENDING";
		List<UserAcmVO> pendinglist= aservice.getadminListAcms(acmActi);
		model.addAttribute("pendinglist", pendinglist);
		size+=pendinglist.size();
		
		acmActi="ACTIVE";
		List<UserAcmVO> activelist= aservice.getadminListAcms(acmActi);
		model.addAttribute("activelist", activelist);
		size+=activelist.size();
		
		acmActi="INACTIVE";
		List<UserAcmVO> inactivelist= aservice.getadminListAcms(acmActi);
		model.addAttribute("inactivelist", inactivelist);
		size+=inactivelist.size();
			
		
		
		System.out.println("전체리스트갯수:"+size);
		model.addAttribute("size", size);
		model.addAttribute("userFstname", getUser(session).getUserFstName());
	}
	
	@GetMapping("/adminviewAcm")//페이지 자체는 없음
	public void adminviewAcmGet(String bizRegnum,Model model,HttpSession session) {
		System.out.println("adminviewAcm Get");
		//UserAcmVO pendinglist= aservice.getadminListAcms(acmActi);
		//AcmVO vo = aservice.getadminAcm(acmNum);
	}
	
	@PostMapping("/adminviewAcm")
	public String adminviewAcmPost(String acmNum,Model model,HttpSession session) {
		System.out.println("adminviewAcm Post");
		
		
		return "/admin/adminviewAcm";
	}
	
}