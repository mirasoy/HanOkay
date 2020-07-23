package com.ana.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.AttachFileDTO;
import com.ana.domain.RevDetailVO;
import com.ana.domain.RevPicVO;
import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;
import com.ana.domain.UserVO;
import com.ana.service.RevService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/review/*")
public class RevController {

	@Autowired
	private RevService service;

	private UserVO user;
	private String userNum;

	// 세션에 정보가 있는지 확인하기
	public void init(HttpSession session) {
		user = (UserVO) session.getAttribute("user");
		userNum = "";
	}

	// 내 예약목록 전체보기
	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		init(session);
		// user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
		if (user != null) {
			userNum = user.getUserNum();
			log.info("list Size>>>>>>" + service.getUserList(userNum).size());
			log.info(userNum + "의 리스트 list");
			model.addAttribute("list", service.getUserList(userNum));
			return "/review/list";
		} else {
			return "redirect:/acm/list";
		}

	}

	// 아직 쓰지않은 예약완료 리스트
	@GetMapping("/unwrittenReviewlist")
	public String unwrittenReviewlist(Model model, HttpSession session) {

		init(session);

		// user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
		if (user != null) {
			userNum = user.getUserNum();
			log.info("list Size>>>>>>" + service.getUserList(userNum).size());
			log.info(userNum + "의 리스트 list");
			model.addAttribute("list", service.getUserList(userNum));
			return "/review/unwrittenReviewlist";
		} else {
			return "redirect:/acm/list";
		}

	}

	// 작성완료 리뷰
	@GetMapping("/writtenReviewlist")
	public String writtenReviewlist(Model model, HttpSession session) {

		init(session);

		// user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
		if (user != null) {
			userNum = user.getUserNum();
			log.info("list Size>>>>>>" + service.getUserList(userNum).size());
			log.info(userNum + "의 리스트 list");
			model.addAttribute("list", service.getUserList(userNum));
			return "/review/writtenReviewlist";
		} else {
			return "redirect:/acm/list";
		}

	}

	// 리뷰등록페이지 열기
	@GetMapping("/register")
	public void registerPage(@RequestParam("bookNum") String bookNum, Model model) {

		log.info("register bookNum>> " + bookNum);
		log.info(" >> " + service.getByBooknum(bookNum));
		model.addAttribute("booking", service.getByBooknum(bookNum));
	}

	// 리뷰등록하기
	@PostMapping("/register")
	public String register(RevVO revP, RedirectAttributes rttr, HttpSession session) {

		boolean registrationStatus = service.getByBooknum(revP.getBookNum()).getPstNum() == null;
		log.info("먼저 등록되엇던 리뷰인지 확인>>" + registrationStatus);
		init(session);

		// user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
		if (user != null) {
			userNum = user.getUserNum();
			
			// 먼저 등록되엇던 리뷰인지 확인하기
			// 뉴 리뷰라면
			if (registrationStatus) {

				log.info("가져온자료>>>>> " + revP);

				RevVO rev = service.getByBooknum(revP.getBookNum());
				rev.setUserNum(userNum);
				rev.setStisf(revP.getStisf());
				rev.setContent(revP.getContent());
				rev.setTitle(revP.getTitle());
				rev.setPicList(revP.getPicList());
				log.info("입력하는 자료>> " + rev);
				service.register(rev);

				return "redirect:/review/writtenReviewlist";
			} else {
				// 중복이라면 돌려보내기
				rttr.addFlashAttribute("msg", "이미 리뷰가 등록된 예약입니다.");
				return "redirect:/review/writtenReviewlist";
			}
			
		}
		rttr.addFlashAttribute("msg", "로그인후 이용해주세요.");
		return "redirect:/review/writtenReviewlist";
	}

	// 리뷰하나 열어서 보기
	@GetMapping("/get")
	public void get(@RequestParam("pstNum") String pstNum, Model model) {

		log.info("/get" + service.get(pstNum));
		log.info("/get" + service.getPhoto(pstNum));

		model.addAttribute("review", service.get(pstNum));
		model.addAttribute("reviewP", service.getPhoto(pstNum));

	}

	// 리뷰수정페이지열기
	@GetMapping("/modify")
	public void getModifyPage(@RequestParam("pstNum") String pstNum, Model model) {

		log.info("/open modi page");
		log.info("/modi THAT >> " + service.get(pstNum));

		model.addAttribute("review", service.get(pstNum));
		model.addAttribute("reviewP", service.getPhoto(pstNum));
	}

	// 리뷰 수정하기
	@PostMapping("/modify")
	public String modify(RevVO review, RedirectAttributes rttr) {
		log.info("modify::::::::::" + review);
		RevVO rv = service.get(review.getPstNum());
		log.info("modify::::>>>::::::::" + rv);

		rv.setTitle(review.getTitle());
		rv.setContent(review.getContent());
		rv.setStisf(review.getStisf());

		
		List<RevPicVO> revPicList =review.getPicList();
		//pst넘버를 불러와서 기존에 있던 사진들을 모두삭제한다
		service.removeAllPhoto(review.getPstNum());
		
		//지금 가지고있는 사진들만 추려서 사진입력을 시도하느 ㄴ서비스를 만들고 그 서비스단에 넣는다.
		service.registerPicture(revPicList);
		
		if (service.modify(rv)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/review/writtenReviewlist";
	}

	// 리뷰삭제하기
	@PostMapping("/delete")
	public String remove(RevVO review, RedirectAttributes rttr) {
		log.info("delete" + review.getPstNum());
		service.remove(review.getPstNum());
		service.removeAllPhoto(review.getPstNum());
		
		return "redirect:/review/list";
	}

	// 이미지 업로드 테스트 단
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("uploadForm");
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("uploadAjax");
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

		String uploadFolder = "c:/upload";

		for (MultipartFile multipartFile : uploadFile) {

			log.info("--------------------------");
			log.info("name >>" + multipartFile.getOriginalFilename());
			log.info("size >>" + multipartFile.getSize());
			log.info("--------------------------");

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				log.error(e.getMessage());
			}

		}

	}

	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<RevPicVO>> uploadAjaxPost(MultipartFile[] uploadFile, String bookNum, Model model) {

		List<RevPicVO> picList = new ArrayList<>();
		log.info("bookNum File : " + bookNum);
		String uploadFolder = "c:/upload/";
		String uploadFolderPath = getFolder();
		// 파일만들기
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFile) {

			// AttachFileDTO attachDTO = new AttachFileDTO();
			RevPicVO pic = new RevPicVO();
			String uploadFilename = multipartFile.getOriginalFilename();

			// IE has fiel path
			uploadFilename = uploadFilename.substring(uploadFilename.lastIndexOf("/") + 1);

			UUID uuid = UUID.randomUUID();
			uploadFilename = uuid.toString() + "_" + uploadFilename;

			try {
				// 파일 세이브
				File saveFile = new File(uploadPath, uploadFilename);
				multipartFile.transferTo(saveFile);

				pic.setPname(uploadFilename);
				pic.setPurl(uploadFolder + uploadFolderPath+"/");
				log.info("uploadFilename : " + uploadFilename);
				log.info("uploadFolder+uploadFolderPath : " + uploadFolder + uploadFolderPath);

				// check image file type
				if (CheckImageType(saveFile)) {
					pic.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFilename));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				picList.add(pic);

			} catch (Exception e) {
				log.error(e.getMessage());
			}

		} // for문 종료

		return new ResponseEntity<List<RevPicVO>>(picList, HttpStatus.OK);
	}

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {

		log.info("fileName: " + fileName);

		File file = new File(fileName);

		log.info("file :" + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		log.info("delete file >"+ fileName);
		
		File file;
		
		try {
			file = new File(URLDecoder.decode(fileName,"UTF-8"));
			file.delete();
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("삭제되었습니다",HttpStatus.OK);
	}
	
	
	
//	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
//	@ResponseBody
//	public ResponseEntity<Resource> downloadFile(String fileName) {
//		log.info("DownLoad File : " + fileName);
//	
//
//		Resource resource = new FileSystemResource("c:/upload/" + fileName);
//
//		log.info("resource" + resource);
//		
//		String resourceName = resource.getFilename();
//		
//		HttpHeaders headers = new HttpHeaders();
//		
//		try {
//			headers.add("Content-Disposition", "attachment; filename="+new String(resourceName.getBytes("UTF-8"),"ISO-8859-1"));
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//
//		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
//	}

	private boolean CheckImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-","/");
	}

}
