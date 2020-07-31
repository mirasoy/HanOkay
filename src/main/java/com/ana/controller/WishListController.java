package com.ana.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.UserVO;
import com.ana.domain.WishListVO;
import com.ana.service.WishListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/wishlist/*")
@AllArgsConstructor
public class WishListController {

	private WishListService service;
	
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
	@GetMapping("/list")
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
		
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■list");
		model.addAttribute("list", service.getWishList(userNum));
	}
	
	
	//조회 페이지
	
	@GetMapping("/get")
	public void get(@RequestParam("wishNum") String wishNum, Model model) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■get");
		model.addAttribute("get", service.get(wishNum));
	}
	
	
//	@GetMapping("/result")
//	public void get2(@RequestParam("wishNum") String wishNum, Model model) {
//		log.info("/result");
//		model.addAttribute("get", service.get(wishNum));
//	}
	
	
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
	
	
	/* 등록작업 ajax */
	
	
	
	@PostMapping(value = "/register", 
			consumes = "application/json", 
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody WishListVO board) {

		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■WishListVO: " + board);

		int insertCount = service.register(board);

		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■Reply INSERT COUNT: " + insertCount);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}	
	
	
	
	

//	 @GetMapping(value = "/pages/{bno}/{page}",
//	 produces = {
//	 MediaType.APPLICATION_XML_VALUE,
//	 MediaType.APPLICATION_JSON_UTF8_VALUE })
//	 public ResponseEntity<List<ReplyVO>> getList(
//	 @PathVariable("page") int page,
//	 @PathVariable("bno") Long bno) {
//	
//	
//	 log.info("getList.................");
//	
//	
//	 return new ResponseEntity<>(service.getList(cri, bno), HttpStatus.OK);
//	 }	
	
	
	
	
//	@RequestMapping("insert.do")
//	  public String insert(WishListVO board, HttpSession session){
//		
//		String wishId = (String) session.getAttribute("wishId");
//		
//		board.setWishNum(wishId);
//찜목록에 기존의 상품이 있는지 검사
		
//		 int count = WishListService.countCart(board.getWishNum(), wishId);
//		 
//	        count == 0 ? WishListService.update(board) : WishListService.register(board);
//	        
//	        if(count == 0){
//	            // 없으면 insert
//	            WishListService.register(board);
//	        } else {
//	            // 있으면 update
//	        	WishListService.update(board);
//	           
//	        }
//	        return "redirect:/wishlist/list.do";
//	}
//	
//	

	


	
	
	
	
	
	
}



