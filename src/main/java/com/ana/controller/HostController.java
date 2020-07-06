package com.ana.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.AcmVO;
import com.ana.domain.Criteria;
import com.ana.domain.PageDTO;
import com.ana.service.AcmService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/hosting/*")
@AllArgsConstructor
public class HostController {
	
	private AcmService service;
	
	@GetMapping("/hostindex")
	public void indexGet() {

	}
	
	@GetMapping("/reserv")
	public void reservGet() {

	}
	
	@GetMapping("/become-host")
	public void becomeHostGet() {

	}
	
	@GetMapping("/become-host1_6")
	public void becomeHostGet1_6() {

	}
	
	@GetMapping("/become-host2_6")
	public void becomeHostGet2_6() {

	}
	
	@GetMapping("/become-host3_6")
	public void becomeHostGet3_6() {

	}
	
	@GetMapping("/become-host4_6")
	public void becomeHostGet4_6() {

	}
	
	@GetMapping("/become-host5_6")
	public void becomeHostGet5_6() {

	}
	
	@GetMapping("/become-host6_6")
	public void becomeHostGet6_6() {

	}
	
	@GetMapping("/become-host-complete")
	public void becomeHostGet_complete() {

	}
	
	@GetMapping("/listings")
	public void listingsGet() {

	}
	
	@GetMapping("/progress/reviews")
	public void reviewsGet() {

	}
	
	@GetMapping("/inbox")
	public void inboxGet() {

	}
	
	@GetMapping("/help")
	public void helpGet() {

	}
	
	//Request
	
	
	//파일 업로드
	@RequestMapping(value = "/upload" , method = RequestMethod.POST)
	public String upload(MultipartHttpServletRequest mtf) throws Exception {
		// 파일 태그
		String fileTag = "file";
	    	// 업로드 파일이 저장될 경로
		String filePath = "C:\\temp\\";
		// 파일 이름	
		MultipartFile file = mtf.getFile(fileTag);
		String fileName = file.getOriginalFilename();
		// 파일 전송
		try {
		    file.transferTo(new File(filePath + fileName));
		} catch(Exception e) {
		    System.out.println("업로드 오류");
		}
			     return "";//돌려보낼 주소    
	}
}
