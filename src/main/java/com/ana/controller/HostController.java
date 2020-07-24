package com.ana.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ana.domain.AcmVO;
import com.ana.domain.RomVO;
import com.ana.domain.UserVO;
import com.ana.service.AcmRegService;
import com.ana.service.RomRegService;
import com.ana.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/hosting/*")
@AllArgsConstructor
public class HostController {
	
	@Autowired
	private RomRegService rservice;//객실관련서비스
	@Autowired
	private AcmRegService aservice;//숙소등록관련서비스
	@Autowired
	private UserService uservice;//호스트 사업등록증관련
	
	
	//세션에서 유저이름 가져오는 메서드
	public UserVO getUser(HttpSession session) {
		UserVO user=(UserVO)session.getAttribute("user");
		if(user==null)return null;
		return user;
	}

	
	///////////////////////
	@GetMapping("/hostindex")
	public void indexGet(Model model,HttpSession session) {
		model.addAttribute("userFstname", getUser(session).getUserFstName());
	}
	
	@GetMapping("/reserv")
	public void reservGet(Model model,HttpSession session) {
		model.addAttribute("userFstname", getUser(session).getUserFstName());
	}
	
	@PostMapping("/listings")
	public String listingsPost() {
		return "/hosting/listings";
	}
	

	
	@GetMapping("/listings")
	public void listingsGet(Model model,HttpSession session) {
		System.out.println("===숙소보기 페이지!===");
		String userPriv= getUser(session).getUserPriv();
		System.out.println(userPriv);
		System.out.println("userPriv?:"+userPriv.equals("HOST"));
		if(userPriv!=null&&!userPriv.equals("HOST")) {
			model.addAttribute("size", 0);
		} else {
			//호스트면
			List<AcmVO> list= aservice.getListHosts(getUser(session).getBizRegisterNumber());
		
			model.addAttribute("list", list);
			model.addAttribute("size", list.size());
		}

		model.addAttribute("userFstname", getUser(session).getUserFstName());
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
		
	
	//become-host단
	
	@GetMapping("/getRom")//숙소 상세보기
	public String getRomGet(@RequestParam("romNum") String romNum, Model model, HttpSession session) {
		System.out.println("겟롬//롬넘이 넘어온다~~~"+romNum);
		
		model.addAttribute("thisrom",rservice.getRom(romNum));//RomVO가 나온다
		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
		return "/hosting/getRom";
	}
	
	@GetMapping("/modifyRom")//내용 전체를 받아서 (Post)숙소 수정하기
	public String modifyRomGet(@RequestParam("romNum") String romNum, Model model) {
		model.addAttribute("thisrom",rservice.getRom(romNum));
		return "/hosting/modifyRom";
	}
	
	@PostMapping("/modifyRom")//내용 전체를 받아서 (Post)숙소 수정하기
	public String modifyRomPost(RomVO vo, Model model,HttpSession session) {
		rservice.modify(vo);//수정된 정보값을 넣어줌
		List<RomVO> romList=rservice.getList(vo.getAcmNum());
		
		model.addAttribute("list", romList);
		model.addAttribute("size", romList.size());

		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
	
		return "/hosting/become-host2_6";
	}
	
	@GetMapping("/removeRom")//숙소 삭제버튼을 받으면
	public String removeRomGet(@RequestParam("romNum") String romNum,@RequestParam("acmNum") String acmNum, Model model,HttpSession session) {
		//System.out.println("롬넘이 넘어온다~~~"+romNum);
		rservice.remove(romNum);
		
		List<RomVO> romList=rservice.getList(acmNum);
		
		model.addAttribute("list", romList);
		model.addAttribute("size", romList.size());
		

		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
		return "/hosting/become-host2_6";
	}
	
	
	@GetMapping("/become-host")
	public void becomeHostGet(Model model,HttpSession session) {
		System.out.println("become-host페이지를 띄운다**");

		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
	}
	
	@PostMapping("/become-host")
	public String becomeHostPost(
			Model model,AcmVO vo,HttpSession session
	) {
		System.out.println("post-become-host로넘어오십니까!");
		String userNum=getUser(session).getUserNum();
		aservice.newAcmReg(vo,userNum);//숙소 등록 시작!register**
		
		model.addAttribute("acmNum", vo.getAcmNum().trim());
		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
		return "redirect:/hosting/become-host1_6";
	}
	
	@GetMapping("/chkaddr")
	public String chkaddrGet() {
		return "/error/error";
	}
	
	
	//주소 중복검사
	@RequestMapping(value = "/chkaddr", method = RequestMethod.POST)
	@ResponseBody
	public void chkaddrPost(String acmDetailaddr,HttpServletRequest request, HttpServletResponse response)
			throws IOException{	
		System.out.println("주소중복체크 Post다!");
		JSONObject jso= new JSONObject();
		log.info("acmDetailaddr check: " +  acmDetailaddr);
		//한글 깨짐 방지
		response.setContentType("text/plain;charset=UTF-8");
		String msg="";
		//service에게 email을 주고 db를 뒤져오게한다
		if (aservice.chkaddr(acmDetailaddr)) {
			msg="해당 주소를 사용하실 수 있습니다";
			jso.put("msg", msg);		
		} 
		else {
			msg="*같은 주소지에 이미 등록된 숙소가 있습니다!";
			jso.put("msg", msg);
		}
		PrintWriter out = response.getWriter();
		out.print(jso);
	}
	
	@GetMapping("/become-host1_6")
	public void becomeHostGet1_6(String acmNum,Model model,HttpSession session) {
		System.out.println("become-hos1_6창 열림~");
		
		model.addAttribute("acmNum", acmNum.trim());
		model.addAttribute("userFstname", getUser(session).getUserFstName());
	}
	
	
	@PostMapping("/become-host1_6")//입력한 상세 숙소정보를 db에 넣자
	public String becomeHostPost1_6(@RequestParam(value="acmOptcode") List<String> acmOptcode,
		String acmNum,String acmDesc,Model model,HttpSession session){
		System.out.println("host1_6 acmNum"+acmNum);
		model.addAttribute("acmNum", acmNum);//여기가 안되는가
		
		
		aservice.update1_6(acmNum,acmOptcode,acmDesc);//한꺼번에 넣어준다***s
		
		List<RomVO> romList=rservice.getList(acmNum);
		System.out.println(romList);
		model.addAttribute("list", romList);
		model.addAttribute("size", romList.size());
		

		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
		return "redirect:/hosting/become-host2_6";
	}

	
	
	
	@GetMapping("/become-host2_6")//뿌려주는 곳
	public void becomeHostGet2_6(String acmNum,Model model,HttpSession session) {
		System.out.println("겟2_6");
		acmNum=acmNum.trim();
		System.out.println("2_6acmNum"+acmNum);

		String acmName=aservice.getAcm(acmNum);
		
		System.out.println("받아온"+acmName);
		model.addAttribute("acmName", acmName);//이름담고
		
		List<RomVO> romList=rservice.getList(acmNum);///??
		System.out.println(romList);
		if(romList==null) {
			model.addAttribute("size", 0);
		}else {
			model.addAttribute("list", romList);
			model.addAttribute("size", romList.size());
		}
		model.addAttribute("acmNum", acmNum);
		model.addAttribute("userFstname", getUser(session).getUserFstName());
	}
	
	
	@PostMapping("/become-host2_6")
	public String becomeHostPost2_6(String acmNum,Model model,HttpSession session) {
		System.out.println("2_6포스트");
		System.out.println("보낼것이 아마 없을텐데");
		
		model.addAttribute("acmNum", acmNum);
		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
		return "redirect:/hosting/become-host-complete";
	}
	

	@GetMapping("/become-host2_6pop")
	public void becomeHostGet2_6pop(String acmNum,Model model) {
		System.out.println("pop열림!");
		acmNum=acmNum.trim();
		model.addAttribute("acmNum", acmNum);
		System.out.println(acmNum);
	}
	
	
	
	
	@PostMapping("/become-host2_6pop")//객실추가할때
	public String becomeHostPost2_6pop(
			RomVO vo,Model model
		) {

		System.out.println("===pop열림Post!===");		
		System.out.println(vo.getRomOptcode());
		System.out.println("나오냐"+vo.getAcmNum());
		System.out.println("전체다보이자"+vo.toString());
		
		rservice.register(vo);
		
		
		List<RomVO> romList=rservice.getList(vo.getAcmNum());///??
		System.out.println(romList);
		model.addAttribute("list", romList);
		model.addAttribute("acmNum", vo.getAcmNum().trim());
		model.addAttribute("size", romList.size());
		
		return "/hosting/become-host2_6"; //겟인가
	}

	
	@GetMapping("/become-host-complete")
	public void becomeHostGet_complete(String acmNum,Model model,HttpSession session) {
		System.out.println("become-host-complete Get");
		
		acmNum = acmNum.trim();
		System.out.println(acmNum);
		model.addAttribute("acmNum", acmNum);
		
		AcmVO vo=aservice.getnewAcm(acmNum);
		System.out.println(vo);
		
		model.addAttribute("acmName", vo.getAcmName());
		model.addAttribute("userFstname", getUser(session).getUserFstName());
	}	

	
	@PostMapping("/become-host-complete")
	public String becomeHostPost_complete(Model model,HttpSession session) {
		model.addAttribute("userFstname", getUser(session).getUserFstName());
		return "/hosting/become-host-complete";//호스트가 가진 숙소 쪽으로 감
	}
	
	@GetMapping("/pendingAcm")
	public void pendingAcmGet(Model model,HttpSession session) {
		System.out.println("pendingAcmGet");
		String biznum= getUser(session).getBizRegisterNumber();
		AcmVO vo=aservice.getpendingacm(biznum);
		
		model.addAttribute("pendingacm", vo);
		model.addAttribute("userFstname", getUser(session).getUserFstName());
	}
	
	@GetMapping("/modipendingAcm")
	public void modipendingAcmGet(Model model,HttpSession session) {
		System.out.println("modi-pendingAcmGet");
		model.addAttribute("biznum", getUser(session).getBizRegisterNumber());
	}
	
}