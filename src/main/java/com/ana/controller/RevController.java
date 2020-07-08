package com.ana.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.AttachFileDTO;
import com.ana.domain.BookingVO;
import com.ana.domain.RevDetailVO;
import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;
import com.ana.domain.UserVO;
import com.ana.service.BookingService;
import com.ana.service.RevService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
//import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class RevController {

	private RevService service;

	@GetMapping("/list")
 	public void list(Model model, HttpSession session) {

		String userNum = (String) session.getAttribute("userNum");

		log.info("userNum>>>>>>" + userNum);
		log.info("list");
		// model.addAttribute("list", service.getBookingList(userNum));
		model.addAttribute("list", service.getUserList("U1"));
	}

	@GetMapping("/unwrittenReviewlist")
	public void unwrittenReviewlist(Model model, HttpSession session) {

		String userNum = (String) session.getAttribute("userNum");

		log.info("userNum>>>>>>" + userNum);
		log.info("list");
		// model.addAttribute("list", service.getBookingList(userNum));
		model.addAttribute("list", service.getUserList("U1"));
	}

	@GetMapping("/writtenReviewlist")
	public void writtenReviewlist(Model model, HttpSession session) {

		String userNum = (String) session.getAttribute("userNum");

		log.info("userNum>>>>>>" + userNum);
		for(RevVO rev :service.getUserList("U1")) {
			log.info("list>>"+ rev.getTitle());
		}
		// model.addAttribute("list", service.getBookingList(userNum));
		model.addAttribute("list", service.getUserList("U1"));
	}

	
	@GetMapping("/register")
	public void register(@RequestParam("bookNum") String bookNum, Model model) {

		log.info("어떤 예약을 쓸거냐?? ?? >> " + bookNum);
		log.info("어떤 예약을 쓸거냐?? ?? >> " + service.getByBooknum(bookNum));
		model.addAttribute("booking", service.getByBooknum(bookNum));
	}

	@PostMapping("/register")
	public String register(RevPostVO revP, RevDetailVO reDetail, RedirectAttributes rttr) {

		RevVO rev = service.getByBooknum(reDetail.getBookNum());

		log.info("register:1>>>>>>>> " + rev);
		rev.setRevPurl("사진임시");
		rev.setTitle(revP.getTitle());
		rev.setContent(reDetail.getContent());
		rev.setStisf(reDetail.getStisf());

		log.info("register:2>>>>>>>> " + rev);
		service.register(rev);
//		rttr.addFlashAttribute("result", review.getPstNum());

		return "redirect:/review/list";
	}

	@GetMapping("/get")
	public void get(@RequestParam("pstNum") String pstNum, Model model) {

		log.info("/get"+service.get(pstNum));

		model.addAttribute("review", service.get(pstNum));

	}

	@GetMapping("/modify")
	public void getModifyPage(@RequestParam("pstNum") String pstNum, Model model) {

		log.info("/open modi page");

		model.addAttribute("review", service.get(pstNum));
	}

	@PostMapping("/modify")
	public String modify(RevVO review, RedirectAttributes rttr) {
		log.info("modify::::::::::"+review.getPstNum()+":::::::::::::::::::::::::::::" + review);
		RevVO rv = service.get(review.getPstNum());
		log.info("modify::::>>>::::::::" + rv);
		//임시설정
		rv.setRevPurl("_");
		
		rv.setTitle(review.getTitle());
		rv.setContent(review.getContent());
		rv.setStisf(review.getStisf());

		
		
		if (service.modify(rv)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/review/list";
	}

	@PostMapping("/delete")
	public String remove(String pstNum, RedirectAttributes rttr) {
		log.info("delete" + pstNum);
		service.remove(pstNum);
		return "redirect:/review/list";
	}
	
	
	
//이미지 업로드 테스트 단
//	@GetMapping("/uploadForm")
//	public void uploadForm() {
//		log.info("uploadForm");
//	}
//
//	@GetMapping("/uploadAjax")
//	public void uploadAjax() {
//		log.info("uploadAjax");
//	}
//
//	@PostMapping("/uploadFormAction")
//	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
//
//		String uploadFolder = "c:/upload";
//
//		for (MultipartFile multipartFile : uploadFile) {
//			log.info("--------------------------");
//			log.info("name >>" + multipartFile.getOriginalFilename());
//			log.info("size >>" + multipartFile.getSize());
//			log.info("--------------------------");
//
//			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
//
//			try {
//				multipartFile.transferTo(saveFile);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				log.error(e.getMessage());
//			}
//
//		}
//
//	}
//
//	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@ResponseBody
//	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile, Model model) {
//
//		List<AttachFileDTO> list = new ArrayList<>();
//		String uploadFolder = "c:/upload";
//
//		String uploadFolderPath = getFolder();
//		// 파일만들기
//		File uploadPath = new File(uploadFolder, uploadFolderPath);
//
//		if (uploadPath.exists() == false) {
//			uploadPath.mkdirs();
//		}
//
//		for (MultipartFile multipartFile : uploadFile) {
//
//			AttachFileDTO attachDTO = new AttachFileDTO();
//
//			String uploadFilename = multipartFile.getOriginalFilename();
//
//			// IE has fiel path
//			uploadFilename = uploadFilename.substring(uploadFilename.lastIndexOf("/") + 1);
//			attachDTO.setFileName(uploadFilename);
//
//			UUID uuid = UUID.randomUUID();
//
//			uploadFilename = uuid.toString() + "_" + uploadFilename;
//
//			try {
//				// 파일 세이브
//				File saveFile = new File(uploadPath, uploadFilename);
//				multipartFile.transferTo(saveFile);
//
//				attachDTO.setUuid(uuid.toString());
//				attachDTO.setUploadPath(uploadFolderPath);
//
//				// check image file type
//				if (CheckImageType(saveFile)) {
//					attachDTO.setImage(true);
//					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFilename));
//					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
//					thumbnail.close();
//				}
//
//				list.add(attachDTO);
//
//			} catch (Exception e) {
//				log.error(e.getMessage());
//			}
//
//		} // for문 종료
//
//		return new ResponseEntity<List<AttachFileDTO>>(list, HttpStatus.OK);
//	}
//
//	@GetMapping("/display")
//	@ResponseBody
//	public ResponseEntity<byte[]> getFile(String fileName) {
//
//		log.info("fileName: " + fileName);
//
//		File file = new File("c:/upload/" + fileName);
//
//		log.info("file :" + file);
//
//		ResponseEntity<byte[]> result = null;
//
//		try {
//			HttpHeaders header = new HttpHeaders();
//			header.add("Content-Type", Files.probeContentType(file.toPath()));
//			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
//
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//		return result;
//	}
//
//	private boolean CheckImageType(File file) {
//		try {
//			String contentType = Files.probeContentType(file.toPath());
//			return contentType.startsWith("image");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return false;
//	}
//
//	private String getFolder() {
//
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = new Date();
//		String str = sdf.format(date);
//		return str.replace("-", File.separator);
//	}

}
