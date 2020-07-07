package com.ana.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ana.domain.RomVO;
import com.ana.service.RomRegService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/hosting/*")
@AllArgsConstructor
public class HostController {
	@Setter(onMethod_= {@Autowired})
	private RomRegService service;
	
	@GetMapping("/hostindex")
	public void indexGet() {

	}
	
	@GetMapping("/reserv")
	public void reservGet() {

	}
	
	
	//become-host단
	//get단
	@GetMapping("/become-host")
	public void becomeHostGet() {

	}
	
	@GetMapping("/become-host1_6")
	public void becomeHostGet1_6() {

	}
	
	@GetMapping("/become-host2_6")//뿌려주기
	public void becomeHostGet2_6(Model model) {
		String acmNum = "ACM0001";
		List<RomVO> romList=service.getList(acmNum);
		
		model.addAttribute("list", romList);
		model.addAttribute("size", romList.size());
		
	}
	
	@GetMapping("/become-host2_6pop")
	public void becomeHostGet2_6pop() {
		
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


	
	@GetMapping("/getRom")
	public String getRomGet(@RequestParam("romNum") String romNum, Model model) {
		//System.out.println("롬넘이 넘어온다~~~"+romNum);
		
		model.addAttribute("thisrom",service.get(romNum));//RomVO가 나온다
		System.out.println("==========여기 넘어오냐앗========");
		return "/hosting/getRom";
	}
	
	//post단
	@PostMapping("/become-host")
	public String becomeHostPost() {
		return "/hosting/become-host1_6";
	}
	
	@PostMapping("/become-host1_6")
	public String becomeHostPost1_6() {
		return "/hosting/become-host1_6";
	}
	
	@PostMapping("/become-host2_6pop")//객실추가할때
	public String becomeHostPost2_6pop(@RequestParam(value="romOptArr[]") List<String> romOptArr,
			@RequestParam(value="acmNum") String acmNum,//숙소번호, +객실번호 생성해야함
			@RequestParam(value="romNum") String romNum,//객실타입
			@RequestParam(value="romType") String romType,//객실타입
			@RequestParam(value="romName") String romName,//객실이름
			@RequestParam(value="romCapa") int romCapa,//객실최대수용인원
			@RequestParam(value="bedType") String bedType,//침대유형
			@RequestParam(value="bedCnt") int bedCnt,//침대갯수
			@RequestParam(value="romSize") int romSize,//객실사이즈
			@RequestParam(value="romPrice") int romPrice,//객실단가
			@RequestParam(value="romLoca") String romLoca,//객실
			@RequestParam(value="romPurl") String romPurl//객실

		) {
		
//		System.out.println("====== 컨트롤러 작동 =======");
//		System.out.println("****룸이름");
//		System.out.println(romName);
//		System.out.println("****룸타입");
//		System.out.println(romType);
//		
//		System.out.println("=======romOptArr======:"+romOptArr.toString());
		
		RomVO rom = new RomVO();
		rom.setAcmNum(acmNum);
		rom.setRomNum(romNum);
		rom.setRomName(romName);
		rom.setRomCapa(romCapa);
		rom.setBedType(bedType);
		rom.setBedCnt(bedCnt);
		rom.setRomSize(romSize);
		rom.setRomPrice(70000);
		rom.setRomLoca(romLoca);
		rom.setRomPurl("RoomPic");
		rom.setRomType(romType);
		
		service.register(rom,romOptArr);
		
		System.out.println("여기까지온댯");
		
		return "/hosting/become-host2_6pop";
	}

	
	
	@PostMapping("/become-host2_6")
	public String becomeHostPost2_6() {

		return "/hosting/become-host2_6";
	}
	
	@PostMapping("/become-host3_6")
	public String becomeHostPost3_6() {
		return "/hosting/become-host3_6";
	}
	
	@PostMapping("/become-host4_6")
	public String becomeHostPost4_6() {
		return "/hosting/become-host4_6";
	}
	
	@PostMapping("/become-host5_6")
	public String becomeHostPost5_6() {
		return "/hosting/become-host5_6";
	}
	
	@PostMapping("/become-host6_6")
	public String becomeHostPost6_6() {
		return "/hosting/become-host6_6";
	}
	
	@PostMapping("/become-host-complete")
	public String becomeHostPost_complete() {
		return "/hosting/become-host-complete";//호스트가 가진 숙소 쪽으로 감
	}
	
	@PostMapping("/listings")
	public String listingsPost() {
		return "/hosting/listings";
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
