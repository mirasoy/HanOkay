package com.ana.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.UserVO;
import com.ana.domain.WishListVO;
import com.ana.service.AcmService;
import com.ana.service.WishListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/wishlist/*")
@AllArgsConstructor
public class WishListController {

	private WishListService service;
	private AcmService acmService;
	
	
	//세션에서 유저 이름을 가져오는 메서드
	public String getUsername(HttpSession session) {
		UserVO user=(UserVO)session.getAttribute("user");
		String userFstname="";
		if(user!=null) {
			userFstname= user.getUserFstName();
		}
		return userFstname;
		
	}
	
	//조회
	@GetMapping({"/list","/list2","/list3","/list1"})
	public void list(Model model, HttpSession session) {
		
		String loginUserNum = (String) session.getAttribute("loginUserNum");
		UserVO user= (UserVO)session.getAttribute("user"); 
		String userLastname="";
		String userFstname="";
		String userPwd="";
		String userNum="";
		
		if(user != null){
		userLastname= user.getUserLastName();
		userFstname=user.getUserFstName();
		userPwd= user.getUserPwd();
		userNum= user.getUserNum();
		} 
		List<WishListVO> list = service.getWishList(userNum);
		
		for(WishListVO vo : list) {
			vo.setAcm(acmService.get(vo.getAcmNum()));
		}
		
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■list");
		model.addAttribute("list", list);
	}
	
	
	//조회 페이지
	
	@GetMapping("/get")
	public void get(Model model, HttpSession session) {
		
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
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■get");
		model.addAttribute("get", service.get(loginUserNum));
	}
	
	
	
	
	//생성페이지
	@PostMapping("/register")
	public String register(WishListVO board, RedirectAttributes rttr) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■register : " + board);
		service.register(board);
		rttr.addFlashAttribute("■■■■■■■■■■■■■■■■result", board.getWishNum());
		return "redirect:/wishlist/list";
		
	}
	
	@GetMapping("/register")
	public void register() {}
		
	
	
	//책에서는 new
	@PostMapping(value = "/register", 
			consumes = "application/json", 
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody WishListVO board) {

		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■WishListVO////////////////////////: " + board);
		
		if(service.countCart(board)==0) {
			int insertCount = service.register(board);
			
			log.info("service.countCart(board)==0" + service.countCart(board));
			log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■Reply INSERT COUNT: " + insertCount);

			return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>("fail..", HttpStatus.OK);		
		
	}	

	
    @RequestMapping("remove.do")
    public String delete(@RequestParam String wishNum){
    	service.remove(wishNum);
        return "redirect:/wishlist/list";
    }
    
  
//    @DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
//	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
//
//		log.info("remove: " + String);
//
//		return service.wishRemove(rno) == 1 
//				? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//
//	}


	
	
}



