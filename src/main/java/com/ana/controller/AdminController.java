package com.ana.controller;


import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ana.domain.AcmDetailPicVO;
import com.ana.domain.AcmVO;
import com.ana.domain.BookVO;
import com.ana.domain.CalendarVO;
import com.ana.domain.RomVO;
import com.ana.domain.UserAcmVO;
import com.ana.domain.UserVO;
import com.ana.service.AcmDetailService;
import com.ana.service.AcmRegService;
import com.ana.service.AdminService;
import com.ana.service.CodeService;
import com.ana.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	
	@Autowired
	private AdminService aservice;//
	@Autowired
	private UserService uservice;//
	@Autowired
	private AcmRegService adservice;
	@Autowired
	private CodeService codeService;
	@Autowired
	private AcmDetailService pservice;
	
	//세션에서 유저이름 가져오는 메서드
	public UserVO getUser(HttpSession session) {
		UserVO user=(UserVO)session.getAttribute("user");
		if(user==null)return null;
		return user;
	}
	
	//오늘의 날짜를 갔다줌
		public CalendarVO getCal() {
			///오늘의 날짜
			Calendar cal = Calendar.getInstance();
			//System.out.println(cal);
			
			CalendarVO today = new CalendarVO(); 
			today.setYear(cal.get(Calendar.YEAR));
			today.setMonth(cal.get(Calendar.MONTH) + 1);
			today.setDay(cal.get(Calendar.DAY_OF_MONTH));
			today.setYoilInt(cal.get(Calendar.DAY_OF_WEEK));
			today.setYoil(getTodayYoil(today.getYoilInt()));
			
			return today;
		}
		
		//요일값 한글로 반환
		public String getTodayYoil(int yoilInt) {
			String yoil = null;
			System.out.println(yoilInt);
			if(yoilInt==1)yoil="일";
			else if(yoilInt==2)yoil="월";
			else if(yoilInt==3)yoil="화";
			else if(yoilInt==4)yoil="수";
			else if(yoilInt==5)yoil="목";
			else if(yoilInt==6)yoil="금";
			else if(yoilInt==7)yoil="토";
			
			return yoil;
		}
	
	///////////////////////
	

	
	
	
	@GetMapping("/adminindex")
	public void indexGet(Model model,HttpSession session) {
		System.out.println("adminindex get");
		
	System.out.println("호스트 인덱스다~~ ");
		
		//호스트 주인
		String ownerUser= getUser(session).getUserNum();
		
		CalendarVO today = getCal();
		//가라임
		//String todays="2020-8-7";
		
		String todayform=today.getYear()+"년 "+ today.getMonth()+"월 "+ today.getDay()+"일 ("+today.getYoil()+")";
		String todays=today.getYear()+"-"+today.getMonth()+"-"+today.getDay();
		
		System.out.println("출력 오늘의 날짜:"+todayform);
		System.out.println("Date형식으로 끌어올 오늘의 날짜:"+todays);
		
		model.addAttribute("todayform",todayform);
		
		/////////////////////////////////////////////////////
		
		String userStat;
		userStat="HO_PENDING";
		List<UserVO> hopendinglist= aservice.getadminListUsers(userStat);
		System.out.println(hopendinglist);
		model.addAttribute("hopendinglist", hopendinglist);
		int hopensize=hopendinglist.size();
		
		model.addAttribute("hopensize", hopensize);
		
		
		
		
		
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
	
	@GetMapping("/userNum_StatPending")
	public String userNum_StatPendingGet(String userNum,Model model,HttpSession session) {
		System.out.println("userNum_StatPending get");
		//숙소정보를 가져온다1
		UserAcmVO pendinghostacm= aservice.getUserNumAcm(userNum);
		System.out.println(pendinghostacm);
		
		model.addAttribute("acmNum", pendinghostacm.getAcmNum());
				
		return "redirect:/admin/userStatPending";
	}
	
	@PostMapping("/userNum_StatPending")
	public void userNum_StatPendingPost(String userNum,Model model,HttpSession session) {
		System.out.println("userNum_StatPending post");
	}
	
	
	@GetMapping("/userStatPending")
	public void userStatPendingGet(String acmNum,Model model,HttpSession session) {
		System.out.println("userStatPending Get");
		
		//숙소정보를 가져온다1
		UserAcmVO pendinghostacm= aservice.getUserAcms(acmNum);
		System.out.println(pendinghostacm);
		
		model.addAttribute("pendinghostacm", pendinghostacm);//숙소뿌리기
		
		///////////////////////////////////////////////////////////
		//숙소에 대한 rom을 가져온다(acmNum필요)2
		List<RomVO> roms = aservice.getRoms(acmNum);
		System.out.println("가저온rom"+roms);
		model.addAttribute("pendingroms", roms);//객실뿌리기
		
		
		//옵션코드List<codeVO>
		model.addAttribute("acmCode", codeService.getAcmCode());
		
		//숙소사진List<AcmDetailPicVO>
		List<AcmDetailPicVO> acmPics = pservice.getPicList(acmNum);
		System.out.println(acmPics.size());
		model.addAttribute("acmPics", acmPics);
		
		
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
		
		//숙소사진List<AcmDetailPicVO>
		List<AcmDetailPicVO> acmPics = pservice.getPicList(acmNum);
		System.out.println(acmPics.size());
		model.addAttribute("acmPics", acmPics);
		
		
	}
	
	
	@PostMapping("/userStatPending")
	public String userStatPendingPost(String userNum,Model model,HttpSession session) {
		UserVO user=aservice.getUser(userNum);//유저 정보 뿌린다
		
		model.addAttribute("user", user);
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
		return "/admin/userStatPending";
	}
	
	@GetMapping("/userStathost")
	public void userStathostGet(String userNum,Model model,HttpSession session) {
		System.out.println("userStathost Get");
		UserVO user=aservice.getUser(userNum);//유저 정보 뿌린다
		List<AcmVO> acms=adservice.getListAcms(user.getUserNum(), "ACTIVE");
		model.addAttribute("user", user);
		model.addAttribute("acms", acms);
		
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
		
		///////////////////세션 새로 걸어준다. 정보가 바뀌었으니///////////////
		System.out.println(getUser(session).getUserStatusCode());
		UserVO user=uservice.letsNewSession(getUser(session).getUserNum());
		System.out.println(user);
		session.setAttribute("user", user);
		System.out.println(getUser(session).getUserStatusCode());

		
		//알림 보내기 기능추가할것 나중에
		
		return "redirect:/admin/adminindex";
	}
	
	@GetMapping("/moditoGuest")//페이지 자체는 없음
	public void moditoGuestGet() {
		System.out.println("moditoGuest Get");
	}
	
	@PostMapping("/moditoGuest")
	public String moditoGuestPost(String userNum, String acmNum,Model model,HttpSession session) {
		System.out.println("moditoGuest Post");
		
		//guest, active, 사업자번호 리셋
		aservice.moditoGuest(userNum,acmNum);
		
		
		///////////////////세션 새로 걸어준다. 정보가 바뀌었으니///////////////
		System.out.println(getUser(session).getUserStatusCode());
		UserVO user=uservice.letsNewSession(getUser(session).getUserNum());
		System.out.println(user);
		session.setAttribute("user", user);
		System.out.println(getUser(session).getUserStatusCode());

		
		//알림 보내기 기능추가할것 나중에
		
		return "redirect:/admin/adminindex";
	}
	
	@GetMapping("/activeAcm")//페이지 자체는 없음
	public void activeAcmGet() {
		System.out.println("activeAcm Get");
	}
	
	@GetMapping("/inactiveAcm")//페이지 자체는 없음
	public void inactiveAcmGet() {
		System.out.println("inactiveAcm Get");
	}
	
	@PostMapping("/activeAcm")
	public String activeAcmPost(String acmNum,Model model,HttpSession session) {
		System.out.println("activeAcm Post");
		
		//guest, active, 사업자번호 리셋
		aservice.activeAcm(acmNum);
		
		//알림 보내기 기능추가할것 나중에
		
		return "redirect:/admin/adminlistings";
	}
	
	@PostMapping("/denyAcm")
	public String denyAcmPost(String acmNum,Model model,HttpSession session) {
		System.out.println("denyAcm Post");
		
		//guest, active, 사업자번호 리셋
		aservice.denyAcm(acmNum);
		
		//알림 보내기 기능추가할것 나중에
		
		return "redirect:/admin/adminlistings";
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
		System.out.println(inactivelist);
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
		
		//숙소사진List<AcmDetailPicVO>
		List<AcmDetailPicVO> acmPics = pservice.getPicList(acmNum);
		System.out.println(acmPics.size());
		model.addAttribute("acmPics", acmPics);
				
	}
	
}