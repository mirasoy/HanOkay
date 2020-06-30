package com.ana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.RomVO;
import com.ana.service.RomService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/rom/*")
@AllArgsConstructor
public class RomController {
	
	private RomService service;
	
	@GetMapping("/list")
	public void list(@RequestParam("acmNum") String acmNum, Model model) {
		log.info("list");
		model.addAttribute("list", service.getList(acmNum));
	}

	@PostMapping("/register")
	public String register(RomVO rom, RedirectAttributes rttr) {
		log.info("register: " + rom);
		service.register(rom);
		rttr.addFlashAttribute("result", rom.getRomNum());
		return "redirect:/rom/list";
	}

	@GetMapping("/get")
	public void get(@RequestParam("romNum") String romNum, Model model) {
		log.info("/get");
		model.addAttribute("rom", service.get(romNum));
	}

	@PostMapping("/modify")
	public String modify(RomVO rom, RedirectAttributes rttr) {
		log.info("modify:" + rom);
		if (service.modify(rom))
			rttr.addFlashAttribute("result", "success");
		return "redirect:/rom/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("romNum") String romNum, RedirectAttributes rttr) {
		log.info("remove..." + romNum);
		if (service.remove(romNum))
			rttr.addFlashAttribute("result", "success");
		return "redirect:/rom/list";
	}

}

// ************************* REST ************************* 
//@RequestMapping("/accommodation/*")
//@RestController
//@Log4j
//@AllArgsConstructor
//public class RomController {
//	private RomService service;
//
//	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
//	public ResponseEntity<String> create(@RequestBody RomVO vo) {
//		log.info("RomVO: " + vo);
//		int insertCount = service.register(vo);
//		log.info("Rom INSERT COUNT: " + insertCount);
//		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
//	
//	@GetMapping(value = "/{romNum}", 
//			produces = { MediaType.APPLICATION_XML_VALUE, 
//					     MediaType.APPLICATION_JSON_UTF8_VALUE })
//	public ResponseEntity<RomVO> get(@PathVariable("romNum") String romNum) {
//		log.info("get: " + romNum);
//		return new ResponseEntity<>(service.get(romNum), HttpStatus.OK);
//	}
//
//	@RequestMapping(method = { RequestMethod.PUT,
//			RequestMethod.PATCH }, value = "/{romNum}", consumes = "application/json", produces = {
//					MediaType.TEXT_PLAIN_VALUE })
//	public ResponseEntity<String> modify(
//			 @RequestBody RomVO vo, 
//			 @PathVariable("romNum") String romNum) {
//		vo.setRomNum(romNum);
//		log.info("romNum: " + romNum);
//		log.info("modify: " + vo);
//		return service.modify(vo) 
//				? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
//
//	@DeleteMapping(value = "/{romNum}", produces = { MediaType.TEXT_PLAIN_VALUE })
//	public ResponseEntity<String> remove(@PathVariable("romNum") String romNum) {
//		log.info("remove: " + romNum);
//		return service.remove(romNum)
//				? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
//

