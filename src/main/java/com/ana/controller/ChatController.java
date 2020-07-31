package com.ana.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ana.domain.ChatRomVO;
import com.ana.domain.MsgVO;
import com.ana.domain.UserVO;
import com.ana.service.ChatRomService;
import com.ana.service.MsgService;
import com.ana.service.RevService;
import com.ana.service.UserService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ChatController {
	private UserVO user;
	private String userNum;

	@Autowired
	private MsgService service;
	@Autowired
	private UserService uService;
	@Autowired
	private ChatRomService chService;

	@RequestMapping(value = "chat/chattingView", method = RequestMethod.GET)
	public ModelAndView chat(@RequestParam("toID") String toID, ModelAndView mv, HttpSession session) {

		user = (UserVO) session.getAttribute("user");
		if (user != null) {

			UserVO toUser = uService.getUserById(toID);

			mv.setViewName("chat/chatRoom");
			mv.addObject("user", user);
			mv.addObject("conversation", service.readConversation(user.getUserNum(), toID));
			System.out.println("toUser ---->>>>" + toUser);
			mv.addObject("toUser", toUser);

		} else {
			mv.setViewName("acm/list");
		}
		return mv;
	}
	
	@PostMapping(value = "chat/chatRoom")
	public ModelAndView chatRoom(@RequestParam("chatromnum") String chatromnum, ModelAndView mv, HttpSession session) {
	
		String otherUser = "";
		user = (UserVO) session.getAttribute("user");
		//로그인여부확인
		System.out.println("도착테스트2"+(chatromnum.split("::")[0].equals("newChatr")));	
		if (user != null) {
		
			//만약 첫 채팅이라면
	if(chatromnum.split("::")[0].equals("newChatr")) {
		
		ChatRomVO chatRoom = new ChatRomVO();
		String[] chatInfoArr = chatromnum.split("::");
		chatRoom.setParticipant1(user.getUserNum());
		chatRoom.setParticipant2(chatInfoArr[1]);
		chatRoom.setLstaccessor(user.getUserNum());
		System.out.println(chatInfoArr[1]+"ㅇㅇㅇㅇㅇ");
		chatRoom.setLastchat(user.getUserFstName()+"님이 입장하였습니다.");
		
		
		chatromnum=  chService.startChat(chatRoom);
		otherUser = chatInfoArr[1];
		
	}else {
			
		System.out.println("도착테스트");
		ChatRomVO vo = chService.readChat(chatromnum);
		
		
		//피아식별
		if( vo.getParticipant1().equals(user.getUserNum())) {
			otherUser =  vo.getParticipant2();
		}else {
			otherUser =  vo.getParticipant1();
		}
		
	}
		//읽음 처리하기
		List<MsgVO> conversation = service.readConversation(user.getUserNum(), otherUser);
		//다음 메세지들 중에서 니가 보낸거 고르기
		for(MsgVO msg :  conversation) {
			if(msg.getUnumTo().contentEquals(user.getUserNum())) {
				service.marksRead(msg.getMsgNum());
			}
		}
		//읽엇다고 처리하기
		
		
		//값넘기기
		mv.addObject("user", user);
		mv.addObject("chatromnum", chatromnum);
		mv.addObject("toUser", uService.get(otherUser));
		mv.addObject("conversation", conversation);
		mv.setViewName("chat/chatRoom");
		}
		else {
			//비로그인 로그인시키기
			mv.setViewName("/user/login");
		}
		return mv;
	}
	
	
	

	

	@GetMapping(value = "chat/chatList")
	public ModelAndView chatList(ModelAndView mv, HttpSession session) {
		log.info("__");
		user = (UserVO) session.getAttribute("user");
		if (user != null) {
			//채팅방받아오기
			List<ChatRomVO> chattingRoomList = chService.readChatlist(user.getUserNum());
			
			
			for(ChatRomVO vo: chattingRoomList) {
				//채팅 방 상대편알려주기
				if( vo.getParticipant1().equals(user.getUserNum())) {
					vo.setOtherUser(uService.get( vo.getParticipant2()));
				}else {
					vo.setOtherUser(uService.get( vo.getParticipant1()));
				}
				
				
				
				//안읽은 메세지 몇개인지 알려주기
				List<MsgVO> conversation = service.readConversation(user.getUserNum(), vo.getOtherUser().getUserNum());
				//다음 메세지들 중에서 니가 보낸거 고르기
				int count = 0;
				for(MsgVO msg :  conversation) {
					if(msg.getUnumTo().contentEquals(user.getUserNum())) {
						if(msg.getReadStatus().trim().equals("F")) {
							count++;
						}
					}
				}
				vo.setUnread(""+count);
			}
			mv.addObject("chatList",chattingRoomList);
			mv.setViewName("chat/chatList");
			return mv;
		} else {
			mv.setViewName("/user/login");
			return mv;
		}
	}

	@PostMapping(value = "chat/sendMsg")
	@ResponseBody
	public ResponseEntity<List<MsgVO>> sendMsg(MsgVO vo, HttpSession session) {

		user = (UserVO) session.getAttribute("user");
		if (user != null) {
			if (vo.getMsgContent() != "" && vo.getMsgContent() != null) {
				service.sendMsg(vo);
				System.out.println("저장 Msg" + vo.getMsgContent()+"::"+user.getUserNum()+"::"+vo.getChatromnum());
				chService.updateChatrom(vo.getMsgContent(), user.getUserNum(), vo.getChatromnum());
			}
			
			
			List<MsgVO> conversation = service.readConversation(user.getUserNum(), vo.getUnumTo());
			for(MsgVO msg :  conversation) {
				if(msg.getUnumTo().contentEquals(user.getUserNum())) {
					service.marksRead(msg.getMsgNum());
				}
			}
			
			
			ResponseEntity<List<MsgVO>> result = new ResponseEntity<List<MsgVO>>(conversation, HttpStatus.OK);
			return result;
		}
		return null;
	}

}