package com.ana.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
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

import com.ana.domain.AcmDetailPicVO;
import com.ana.domain.AcmVO;
import com.ana.domain.BookVO;
import com.ana.domain.CalendarVO;
import com.ana.domain.RomVO;
import com.ana.domain.UserVO;
import com.ana.service.AcmDetailService;
import com.ana.service.AcmRegService;
import com.ana.service.BookingService;
import com.ana.service.CodeService;
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
	@Autowired
	private CodeService codeService;
	@Autowired
	private BookingService bservice;
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
		today.setDay(cal.get(Calendar.MONTH) + 1);
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
	@GetMapping("/hostindex")
	public void indexGet(Model model,HttpSession session) {
		System.out.println("호스트 인덱스다~~ ");
		
		//호스트 주인
		String ownerUser= getUser(session).getUserNum();
		
		CalendarVO today = getCal();
		//가라임
		//String today="2020-8-7";
		
		String todayform=today.getYear()+"년 "+ today.getMonth()+"월 "+ today.getDay()+"일 ("+today.getYoil()+")";
		String todays=today.getYear()+"-"+today.getMonth()+"-"+today.getDay();
		
		System.out.println("출력 오늘의 날짜:"+todayform);
		System.out.println("Date형식으로 끌어올 오늘의 날짜:"+todays);
		
		model.addAttribute("todayform",todayform);

		List<BookVO> chkin=bservice.dateGetinBooking(ownerUser,todays);
		if(chkin.size()==0)model.addAttribute("chkinSize", 0);
		else model.addAttribute("chkinSize", chkin.size());
		
		
		List<BookVO> chkout=bservice.dateGetoutBooking(ownerUser,todays);
		model.addAttribute("chkin", chkin);
		model.addAttribute("chkout", chkout);
		
		
		model.addAttribute("userFstname", getUser(session).getUserFstName());
	}
	
	@GetMapping("/reserv")
	public void reservGet(Model model,HttpSession session) {
		UserVO user=getUser(session);

		//운영중인 숙소들을 끌어옴
		String acmActi="ACTIVE";
		//호스트의 userNum=ownerUser로 숙소를 끌고온다
		List<AcmVO> acms=aservice.getListAcms(user.getUserNum(), acmActi);
		model.addAttribute("acms", acms);
		
		
		model.addAttribute("userFstname", user.getUserFstName());
	}
	
	//숙소가 선택될때마다 숙소에대한 객실들을 가져오자
		@RequestMapping(value = "/returnRoms", method = RequestMethod.POST)
		@ResponseBody
		public void selAcmPost(String acmDetailaddr,HttpServletRequest request, HttpServletResponse response)
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
	
	

	@GetMapping("/listings")
	public void listingsGet(Model model,HttpSession session) {
		System.out.println("===숙소보기 페이지! listingsGet===");
		UserVO user=getUser(session);
		if(user==null)return;
		String userPriv= user.getUserPriv();
		String userStat=user.getUserStatusCode();
		String ownerUserNum=user.getUserNum();
		String acmActi;
		int size=0;
		System.out.println(userPriv);
		System.out.println(userStat);
		System.out.println(ownerUserNum);
		
		if(userPriv==null)return;
		if(userPriv.equals("GUEST")) {
			if(userStat.equals("ACTIVE"))return;
			//HO_PENDING인경우
			acmActi="PENDING";
			System.out.println(1);
			List<AcmVO> pendinglist= aservice.getListAcms(ownerUserNum,acmActi);
			model.addAttribute("pendinglist", pendinglist);//
			size+=pendinglist.size();
			
		} else if(userPriv.equals("HOST")){
			//호스트면
			acmActi="PENDING";
			List<AcmVO> pendinglist= aservice.getListAcms(ownerUserNum,acmActi);
			model.addAttribute("pendinglist", pendinglist);
			
			if(pendinglist.size()!=0) {//심사대기가 하나라도 있으면 안된다
				System.out.println("펜딩있음!");
				model.addAttribute("newnotallowed", true);//
			}
			size+=pendinglist.size();
			
			acmActi="ACTIVE";
			List<AcmVO> activelist= aservice.getListAcms(ownerUserNum,acmActi);
			model.addAttribute("activelist", activelist);//
			size+=activelist.size();
			
			acmActi="INACTIVE";
			List<AcmVO> inactivelist= aservice.getListAcms(ownerUserNum,acmActi);
			model.addAttribute("inactivelist", inactivelist);//
			size+=inactivelist.size();
			
			
		}
		
		System.out.println("전체리스트갯수:"+size);
		model.addAttribute("size", size);//
		
		model.addAttribute("userFstname", getUser(session).getUserFstName());//
		System.out.println("전체리스트뀨뀨뀨뀨뀨뀨뀨갯수:");
	}
	

	@PostMapping("/listings")
	public String listingsPost() {
		System.out.println("===숙소보기 페이지! listingsPost===");
		
		return "/hosting/listings";
	}
	
	@GetMapping("/getAcm")//이미호스트 자기숙소보기
	public void getAcmGet(String acmNum,Model model, HttpSession session) {
		System.out.println("===getAcm get===");
		
		//선택된 숙소 보기
		AcmVO selectacm = aservice.getnewAcm(acmNum);
		model.addAttribute("acm", selectacm);
		
		//선택된 숙소의 
		List<RomVO> roms=rservice.getList(acmNum);
		model.addAttribute("roms", roms);
		

		//옵션코드List<codeVO>
		model.addAttribute("acmCode", codeService.getAcmCode());
		model.addAttribute("romCode", codeService.getRomCode());
		
		//숙소사진List<AcmDetailPicVO>
		List<AcmDetailPicVO> acmPics = pservice.getPicList(acmNum);
		System.out.println(acmPics.size());
		model.addAttribute("acmPics", acmPics);
		
		model.addAttribute("userFstname", getUser(session).getUserFstName());

	}

	
	@GetMapping("/getAcmSwitch")//이미호스트 자기숙소 선택하기
	public void getAcmSwitchGet(String acmNum,Model model, HttpSession session) {
		System.out.println("===getAcmSwitch get===");
		
		AcmVO vo = aservice.getnewAcm(acmNum);
		String bizRegnum=getUser(session).getBizRegisterNumber();
		
		aservice.getListAcms(bizRegnum,"ACTIVE");
		
		model.addAttribute("acm", vo);
		model.addAttribute("userFstname", getUser(session).getUserFstName());

	}
	
	@PostMapping("/getAcm")
	public String getAcmPost() {
		System.out.println("===getAcm post===");
		
		return "/hosting/getAcm";
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
		
		//옵션코드List<codeVO>
		model.addAttribute("romCode", codeService.getRomCode());
				
		
		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
		return "/hosting/getRom";
	}
	
	@GetMapping("/modifyRom")//내용 전체를 받아서 (Post)숙소 수정하기
	public String modifyRomGet(@RequestParam("romNum") String romNum, Model model,HttpSession session) {
		System.out.println("modiRom"+romNum);
		
		model.addAttribute("thisrom",rservice.getRom(romNum));
		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
		return "/hosting/modifyRom";
	}
	
	@PostMapping("/modifyRom")//내용 전체를 받아서 (Post)숙소 수정하기
	public String modifyRomPost(RomVO vo, Model model,HttpSession session) {
		System.out.println("******modiRom:"+vo.toString());
		
		rservice.modify(vo);//수정된 정보값을 넣어줌
		List<RomVO> romList=rservice.getList(vo.getAcmNum());
		
		model.addAttribute("list", romList);
		model.addAttribute("size", romList.size());

		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
	
		return "/hosting/become-host2_6";
	}
	
	@GetMapping("/removeRom")//객실 삭제버튼을 받으면===================================================
	public String removeRomGet(@RequestParam("romNum") String romNum,@RequestParam("acmNum") String acmNum, Model model,HttpSession session) {
		System.out.println("삭제하자 롬넘이 넘어온다~~~"+romNum);
		
		model.addAttribute("acmNum", acmNum);
		
		
		boolean removeokay=rservice.remove(romNum);
		System.out.println("removeokay"+removeokay);
		
		List<RomVO> romList=rservice.getList(acmNum);
		
		model.addAttribute("list", romList);
		model.addAttribute("size", romList.size());
		

		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
		return "redirect:/hosting/become-host2_6";
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
		

		
		
		System.out.println(getUser(session).getUserStatusCode());//
		
		UserVO user=uservice.letsNewSession(getUser(session).getUserNum());
		System.out.println(user);
		
		session.setAttribute("user", user);//세션 새로 걸어준다. 정보가 바뀌었으니
		
		System.out.println(getUser(session).getUserStatusCode());//
		
		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
		return "redirect:/hosting/become-host1_6";
	}
	
	
	@GetMapping("/become-host0")
	public void becomeHost0Get(Model model,HttpSession session) {
		System.out.println("become-host0페이지를 띄운다**");

		model.addAttribute("userFstname", getUser(session).getUserFstName());
		model.addAttribute("biznum", getUser(session).getBizRegisterNumber());
	}

	
	@PostMapping("/become-host0")
	public String becomeHost0Post(
			Model model,AcmVO vo,HttpSession session
	) {
		System.out.println("post-become-host0로넘어오십니까!");
		String userNum=getUser(session).getUserNum();
		aservice.newAcmReg(vo,userNum);//숙소 등록 시작!register**
		
		model.addAttribute("acmNum", vo.getAcmNum().trim());
		

		
		//세션 다시주기
		
		UserVO user=uservice.letsNewSession(getUser(session).getUserNum());
		System.out.println(user);
		session.setAttribute("user", user);
		System.out.println(getUser(session).getUserStatusCode());//
		
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
	
	//주소 중복검사
		@RequestMapping(value = "/chkbizused", method = RequestMethod.POST)
		@ResponseBody
		public void chkbizusedPost(String bizRegnum, String userNum,HttpServletRequest request, HttpServletResponse response)
				throws IOException{	
			System.out.println("사업자번호 체크이다 Post다!");
			JSONObject jso= new JSONObject();
			log.info("chkbizused check: " +  bizRegnum);
			//한글 깨짐 방지
			response.setContentType("text/plain;charset=UTF-8");
			String msg2="";
			//service에게 email을 주고 db를 뒤져오게한다
			if (aservice.chkbizused(bizRegnum,userNum)) {
				msg2="해당 사업자등록 번호를 사용하실 수 있습니다";
				jso.put("msg2", msg2);		
			} 
			else {
				msg2="*사용하실수 없는 사업자등록번호입니다, 관리자에게 문의해주세요!";
				jso.put("msg2", msg2);
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
		acmNum=acmNum.toString();
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
		String userStat=getUser(session).getUserStatusCode();
		AcmVO vo=aservice.getpendingacm(biznum);
		System.out.println(vo.toString());
		model.addAttribute("pendingacm", vo);
		model.addAttribute("userFstname", getUser(session).getUserFstName());
	}
	
	@GetMapping("/modipendingAcm")
	public void modipendingAcmGet(Model model,HttpSession session) {
		System.out.println("modi-pendingAcmGet");
		model.addAttribute("biznum", getUser(session).getBizRegisterNumber());
	}
	
	@GetMapping("/removeAcm")
	public void removeAcmGet() {
		System.out.println("removeAcm페이지를 띄운다**");
	}
	
	@PostMapping("/removeAcm")//********이게 대박이여`~~
	public String removeAcm(String acmNum,Model model,HttpSession session) {
		System.out.println("removeAcmPost");
		String userNum=getUser(session).getUserNum();
		String userPriv=getUser(session).getUserPriv();
		System.out.println(acmNum);
		System.out.println(userNum);
		System.out.println(userPriv);

		//해당 숙소외 active나 inactive숙소가 여러개 남아있는 사람이면 host/ho_active
		//해당 숙소외 active나 inactive숙소가 없는 사람은 guest/active로
		//ho_pending이었던 사람은 guest/active로
		
		//acmNum에 관련된 숙소와 객실은 모두 삭제
		aservice.removeAcm(acmNum, userNum, userPriv);
		
		///////////////////세션 새로 걸어준다. 정보가 바뀌었으니///////////////
		System.out.println(getUser(session).getUserStatusCode());
		UserVO user=uservice.letsNewSession(getUser(session).getUserNum());
		System.out.println(user);
		session.setAttribute("user", user);
		System.out.println(getUser(session).getUserStatusCode());
				
		
		
		model.addAttribute("userFstname", getUser(session).getUserFstName());
		
		return "/acm/list";//호스트가 가진 숙소 쪽으로 감
	}
}