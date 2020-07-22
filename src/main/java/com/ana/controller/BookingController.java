package com.ana.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.BookingVO;
import com.ana.domain.UserVO;
import com.ana.service.BookingService;
//import com.ana.service.MailService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor




public class BookingController {
	private BookingService service;
	
	
	   //세션에서 유저이름 가져오는 메서드
	   public String getUsername(HttpSession session) {
	      UserVO user=(UserVO)session.getAttribute("user");
	  String userFstname="";
	      
	      if(user!=null) {
	         userFstname=user.getUserFstName();
	      }
	      

	      
	      return userFstname;
	   }


	
	
	
	
	//모든 목록
	@GetMapping("/bookListAll") //모든 목록에 대한 조회는 get방식으로 처리를 하므로 이걸 사용했다.
	public void list(Model model, HttpSession session) {
		
		String loginUserNum = (String) session.getAttribute("loginUserNum");
		
		UserVO user= (UserVO)session.getAttribute("user"); 
		String userLastname="";
		String userFstname="";
		String userPwd="";
		String userNum="";
		//userNum = "U1";

		//user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
		if(user != null){
		userLastname= user.getUserLastName();
		userFstname=user.getUserFstName();
		userPwd= user.getUserPwd();
		userNum= user.getUserNum();
		} 
		
		log.info("bookListAll");
		model.addAttribute("bookListAll", service.getBookListAll(userNum));
	}
	
	//예약 예정 목록
	@GetMapping("/bookList")
	public void list2(Model model2, HttpSession session) {
		String loginUserNum = (String) session.getAttribute("loginUserNum");
		UserVO user= (UserVO)session.getAttribute("user"); 
		String userLastname="";
		String userFstname="";
		String userPwd="";
		String userNum="";
		
		//user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
		if(user != null){

		userLastname= user.getUserLastName();
		userFstname=user.getUserFstName();
		userPwd= user.getUserPwd();
		userNum= user.getUserNum();
		} 

		log.info("bookList");
		model2.addAttribute("bookList", service.getBookList(userNum));
	}
	
	
	//예약 완료 목록
	@GetMapping("/checkout") //이건 체크아웃으로 이동해야해
	public void list3(Model model3, HttpSession session) { //세션에 담긴 값을 가져와야겠지
		
		String loginUserNum = (String) session.getAttribute("loginUserNum");
		UserVO user= (UserVO)session.getAttribute("user"); 
		String userLastname="";
		String userFstname="";
		String userPwd="";
		String userNum="";
		
		//user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.

		if(user != null){ //내가 user가 맞다면 정보를 가져와야겠다.
		userLastname= user.getUserLastName();
		userFstname=user.getUserFstName();
		userPwd= user.getUserPwd();
		userNum= user.getUserNum();
		} 

		
		
		log.info("checkout 완료된 예약입니다.");
		model3.addAttribute("checkout", service.getCheckoutList(userNum)); //이 정보를 여기다가 담는다.
	}
	
	//예약 취소 목록
	@GetMapping("/cancelled")
	public void list4(Model model4, HttpSession session) {
		String loginUserNum = (String) session.getAttribute("loginUserNum");		
		
		UserVO user= (UserVO)session.getAttribute("user"); 
		String userLastname="";
		String userFstname="";
		String userPwd="";
		String userNum="";
		
		//user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
		if(user != null){

		userLastname= user.getUserLastName();
		userFstname=user.getUserFstName();
		userPwd= user.getUserPwd();
		userNum= user.getUserNum();
		} 

		log.info("cancelled 취소된 예약입니다.");
		model4.addAttribute("cancelled", service.getCancelList(userNum));		
	}
	
	
	
	
	
	//예약 조회 페이지와 이동	
	@GetMapping({"/info", "/info2", "/info3", "modify"})
	public void get(@RequestParam("bookNum") String bookNum, Model model) {
		log.info("/info or modify");
		
		model.addAttribute("info", service.get(bookNum));
			
		
		
		
	}
	
	

//예약 수정	
	@PostMapping("/modify")
	public String modify(BookingVO info, RedirectAttributes rttr) {
		
		
		log.info("modify:"+info);
		log.info("되었습니다.");
		
		if(service.modify(info)) {
			rttr.addFlashAttribute("result", "success");
		}		
		return "redirect:/mypage/bookList";
	}

//예약 취소  ( 취소시, 상태를 변화시키고, 로그에 저장한다 )
	@PostMapping("/remove")
	public String remove(@RequestParam("bookNum") String bookNum, RedirectAttributes rttr) {
		log.info("당신의 예약을 취소합니다...." + bookNum);
		if(service.reserveCancel(bookNum,"RS_STT_BC")) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/mypage/bookList";
	}
	

	
}