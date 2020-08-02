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
import com.ana.service.CodeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	
	@Autowired
	private AdminService aservice;//호스트 사업등록증관련
	@Autowired
	private CodeService codeService;
	
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
		int hopensize=0;	
			
		userStat="ACTIVE";
		List<UserVO> activelist= aservice.getadminListUsers(userStat);
		model.addAttribute("activelist", activelist);
		size+=activelist.size();
		
		userStat="HO_PENDING";
		List<UserVO> hopendinglist= aservice.getadminListUsers(userStat);
		System.out.println(hopendinglist);
		model.addAttribute("hopendinglist", hopendinglist);
		size+=hopendinglist.size();
		hopensize+=hopendinglist.size();
		
		userStat="HO_ACTIVE";
		List<UserVO> hoactivelist= aservice.getadminListUsers(userStat);
		model.addAttribute("hoactivelist", hoactivelist);
		size+=hoactivelist.size();
			
		
		
		System.out.println("전체리스트갯수:"+size);
		model.addAttribute("size", size);
		model.addAttribute("hopensize", hopensize);
		
		model.addAttribute("userFstname", getUser(session).getUserFstName());
	
	}
	
	
	
	@GetMapping("/userStatPending")
	public void userStatPendingGet(String bizRegnum,Model model,HttpSession session) {
		System.out.println("userStatPending Get");
		System.out.println(bizRegnum);
		
		//숙소정보를 가져온다1
		UserAcmVO pendinghostacm= aservice.getPendingUserAcms(bizRegnum);
		System.out.println(pendinghostacm);
		
		model.addAttribute("pendinghostacm", pendinghostacm);//숙소뿌리기
		
		///////////////////////////////////////////////////////////
		String acmNum=pendinghostacm.getAcmNum();
		//숙소에 대한 rom을 가져온다(acmNum필요)2
		List<RomVO> roms = aservice.getRoms(acmNum);
		System.out.println("가저온rom"+roms);
		model.addAttribute("pendingroms", roms);//객실뿌리기
		
		
		//옵션코드List<codeVO>
		model.addAttribute("acmCode", codeService.getAcmCode());
		
	}
	
	@GetMapping("/adminPendingviewAcm")
	public void adminPendingviewAcmGet(String acmNum,Model model,HttpSession session) {
		
		System.out.println("adminPendingviewAcm Get");
		System.out.println(acmNum);
		
		UserAcmVO getuseracm= aservice.getUserAcms(acmNum);
		System.out.println(getuseracm);
		model.addAttribute("getuseracm", getuseracm);
		
	///////////////////////////////////////////////////////////
		
		
		//숙소에 대한 rom을 가져온다(acmNum필요)2
		List<RomVO> roms = aservice.getRoms(acmNum);
		System.out.println("가저온rom"+roms);
		model.addAttribute("roms", roms);//객실뿌리기
		
		//옵션코드List<codeVO>
		model.addAttribute("acmCode", codeService.getAcmCode());
		
	}
	
	
	@PostMapping("/userStatPending")
	public String userStatPendingPost(String userNum,Model model,HttpSession session) {
		System.out.println("userStatPending Post");
		
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		return "/admin/userStatPending";
	}
	
	@GetMapping("/userStathost")
	public void userStathostGet(String userNum,Model model,HttpSession session) {
		System.out.println("userStathost Get");
		UserVO user=aservice.getUser(userNum);//유저 정보 뿌린다
		
		model.addAttribute("user", user);
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		
	}
	
	//@PostMapping("/userStathost")
	public String userStathostPost(String userNum,Model model,HttpSession session) {
		System.out.println("userStathost Post");
		
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		return "/admin/userStathost";
	}
	
	@GetMapping("/userStatguest")
	public void userStatguestGet(String userNum,Model model,HttpSession session) {
		System.out.println("userStatguest Get");
		UserVO user=aservice.getUser(userNum);//유저 정보 뿌린다
		
		model.addAttribute("user", user);
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		
	}
	
	//@PostMapping("/userStatguest")
	public String userStatguestProcPost(String userNum,Model model,HttpSession session) {
		System.out.println("userStatguest Post");
		
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		return "/admin/userStatguest";
	}
	
	@GetMapping("/moditoHost")//페이지 자체는 없음
	public void moditoHostGet() {
		System.out.println("moditoHost Get");
	}
	
	
	
	@PostMapping("/moditoHost")
	public String moditoHostPost(String userNum, String acmNum, Model model,HttpSession session) {
		System.out.println("moditoHost Post");
		aservice.moditoHost(userNum, acmNum);//회원상태, 숙소, 객실 상태를 모두 바꿈
		
		
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
		
		
		//옵션코드List<codeVO>
		model.addAttribute("acmCode", codeService.getAcmCode());
		
		model.addAttribute("userFstname", getUser(session).getUserFstName());
	}
	
	
	
	
	@GetMapping("/adminviewAcm")
	public void adminviewAcmGet(String acmNum,Model model,HttpSession session) {
		System.out.println("adminviewAcm Get");
		System.out.println(acmNum);
		
		UserAcmVO getuseracm= aservice.getUserAcms(acmNum);
		System.out.println(getuseracm);
		model.addAttribute("getuseracm", getuseracm);
		
	///////////////////////////////////////////////////////////
		
		
		//숙소에 대한 rom을 가져온다(acmNum필요)2
		List<RomVO> roms = aservice.getRoms(acmNum);
		System.out.println("가저온rom"+roms);
		model.addAttribute("roms", roms);//객실뿌리기
		
		//옵션코드List<codeVO>
		model.addAttribute("acmCode", codeService.getAcmCode());
		
	}
	
	@PostMapping("/activeAcm")
	public String activeAcmPost(String acmNum,Model model,HttpSession session) {
		System.out.println("activeAcm Post");
		
		
		return "/admin/adminlistings";
	}
	
	
	@GetMapping("/activeAcm")
	public void adminviewAcmGet() {
		System.out.println("activeAcm Get");
	}
	

	@PostMapping("/inactiveAcm")
	public String inactiveAcmPost(String acmNum,Model model,HttpSession session) {
		System.out.println("inactiveAcm Post");
		
		
		return "/admin/adminlistings";
	}
	
	
	@GetMapping("/inactiveAcm")
	public void inactiveAcmGet() {
		System.out.println("inactiveAcm Get");
	}

}