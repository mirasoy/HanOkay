package com.ana.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
//
//	@RequestMapping(value = "chat/chattingView", method = RequestMethod.GET)
//	public ModelAndView chat(@RequestParam("toID") String toID, ModelAndView mv, HttpSession session) {
//
//		user = (UserVO) session.getAttribute("user");
//		if (user != null) {
//
//			UserVO toUser = uService.getUserById(toID);
//
//			mv.setViewName("chat/chatRoom");
//			mv.addObject("user", user);
//			mv.addObject("conversation", service.readConversation(user.getUserNum(), toID));
//			System.out.println("toUser ---->>>>" + toUser);
//			mv.addObject("toUser", toUser);
//
//		} else {
//			mv.setViewName("acm/list");
//		}
//		return mv;
//	}

	@PostMapping(value = "chat/chatRoom")
	public ModelAndView chatRoom
			(@RequestParam("chatromnum") String chatromnum, @RequestParam("requestURL") String requestURL, ModelAndView mv, HttpSession session) {

		
		
		String otherUser = "";
		user = (UserVO) session.getAttribute("user");
		// 로그인여부확인
		System.out.println("어디서왓니 >> " + requestURL);
		if (user != null) {

			// 만약 호스트에 넘어온 채팅이라면이라면
			if (chatromnum.split("::")[0].equals("newChatr")) {
				System.out.println(">>> 메세지 보내기에서 넘어온 챗방임");
				String[] chatInfoArr = chatromnum.split("::");

				// 진짜 첫 채팅인지 확인하기

				if (chService.findChatRom(chatInfoArr[1], user.getUserNum()).size() != 0) {

					System.out.println(">>>처음 아님");

					chatromnum = chService.findChatRom(chatInfoArr[1], user.getUserNum()).get(0).getChatromnum();

					ChatRomVO vo = chService.readChat(chatromnum);

					// 피아식별
					if (vo.getParticipant1().equals(user.getUserNum())) {
						otherUser = vo.getParticipant2();
					} else {
						otherUser = vo.getParticipant1();
					}

				} else {
					System.out.println(">>> 첫채팅 시자ㅣㄱ함");
					ChatRomVO chatRoom = new ChatRomVO();

					// 챗룸 셋팅
					chatRoom.setParticipant1(user.getUserNum());
					chatRoom.setParticipant2(chatInfoArr[1]);
					chatRoom.setLstaccessor(user.getUserNum());
					chatRoom.setLastchat(user.getUserFstName() + "님이 입장하였습니다.");

					System.out.println(chatInfoArr[1] + "");
					chatromnum = chService.startChat(chatRoom);

					otherUser = chatInfoArr[1];
				}

			} else {

				System.out.println(">>> 쳇방리스트를 통해들어옴");
				ChatRomVO vo = chService.readChat(chatromnum);

				// 피아식별
				if (vo.getParticipant1().equals(user.getUserNum())) {
					otherUser = vo.getParticipant2();
				} else {
					otherUser = vo.getParticipant1();
				}

			}

			// 읽음 처리하기
			List<MsgVO> conversation = service.readConversation(user.getUserNum(), otherUser);

			// 다음 메세지들 중에서 니가 보낸거 고르기

			if (conversation.size() != 0) {

				for (MsgVO msg : conversation) {
					if (msg.getUnumTo().contentEquals(user.getUserNum())) {
						// 읽엇다고 처리하기
						service.marksRead(msg.getMsgNum());
					}
				}

			}

			System.out.println("채팅방 참여자  상대방>" + otherUser + "나>" + user.getUserFstName());

			// 값넘기기
			mv.addObject("user", user);
			mv.addObject("chatromnum", chatromnum);
			mv.addObject("toUser", uService.get(otherUser));
			mv.addObject("conversation", conversation);
			
			if(requestURL.equals("hosting")) {
				mv.setViewName("chat/chatRoom2");
				
				}else {
					mv.setViewName("chat/chatRoom");
				}
		} else {
			// 비로그인 로그인시키기
			mv.setViewName("/user/login");
		}
		return mv;
	}

	@GetMapping({"chat/chatList","chat/chatList2"})
	public ModelAndView chatList(ModelAndView mv, HttpSession session, HttpServletRequest request) {
		log.info("__");
		user = (UserVO) session.getAttribute("user");
		if (user != null) {

			// 넘어온 위치 파악하기
			String url = request.getHeader("referer").split("/")[3]; // => acm/list
			

			// 채팅방받아오기
			
			
			if (null!= chService.readChatlist(user.getUserNum()) ) {
				
				List<ChatRomVO> chattingRoomList = chService.readChatlist(user.getUserNum());
				
				for (ChatRomVO vo : chattingRoomList) {
					// 채팅 방 상대편알려주기

					if (vo.getParticipant1().equals(user.getUserNum())) {
						vo.setOtherUser(uService.get(vo.getParticipant2()));
					} else {
						vo.setOtherUser(uService.get(vo.getParticipant1()));
					}

					// 안읽은 메세지 몇개인지 알려주기
					
					
					List<MsgVO> conversation = service.readConversation(user.getUserNum(),
							vo.getOtherUser().getUserNum());

					int count = 0;
					if (conversation.size() != 0) {

						for (MsgVO msg : conversation) {
							if (msg.getUnumTo().contentEquals(user.getUserNum())) {
								if (msg.getReadStatus().trim().equals("F")) {
									count++;
								}
							}
						}
					}
					// 다음 메세지들 중에서 니가 보낸거 고르기
					
					log.info("4");
					log.info(vo.getOtherUser().getUserFstName()+":unread::" + count);
					vo.setUnread("" + count);
				}
				mv.addObject("requestURL", url);
				mv.addObject("chatList", chattingRoomList);

				if(url.equals("hosting")) {
				mv.setViewName("chat/chatList2");
				
				}else {
					mv.setViewName("chat/chatList");
				}
				return mv;
				
				
				
			}else {
				mv.setViewName("/user/login");
				return mv;
			}
			
			
		} else {
			mv.setViewName("/user/login");
			return mv;
		}
	}

	@PostMapping(value = "chat/sendMsg")
	@ResponseBody
	public ResponseEntity<List<MsgVO>> sendMsg(MsgVO vo, HttpSession session) {

		user = (UserVO) session.getAttribute("user");
		// 로그인 여부확인하기
		if (user != null) {

			// 빈메세지 아닐때만 전송하기
			if (vo.getMsgContent() != "" && vo.getMsgContent() != null) {

				// 메세지 전송하기-저장하기
				service.sendMsg(vo);

				System.out.println("저장 Msg : " + vo.getMsgContent() + "::" + vo.getUnumFrom() + ">>>>" + vo.getUnumTo()
						+ "::" + vo.getChatromnum());

				// 저장정보업데이트하기
				chService.updateChatrom(vo.getMsgContent(), user.getUserNum(), vo.getChatromnum());
			}

			List<MsgVO> conversation = service.readConversation(user.getUserNum(), vo.getUnumTo());
			if (conversation.size() != 0) {

				for (MsgVO msg : conversation) {
					if (msg.getUnumTo().contentEquals(user.getUserNum())) {
						service.marksRead(msg.getMsgNum());
					}
				}
			}
			ResponseEntity<List<MsgVO>> result = new ResponseEntity<List<MsgVO>>(conversation, HttpStatus.OK);
			return result;
		}
		return null;
	}

	@PostMapping(value = "/unreadMsg")
	@ResponseBody
	public ResponseEntity<String> unreadMsg(HttpSession session) {
		
		user = (UserVO) session.getAttribute("user");
		// 로그인 여부확인하기
		if (user != null) {
		service.unreadMsg(user.getUserNum());
		return new ResponseEntity<String>(""+(service.unreadMsg(user.getUserNum())),HttpStatus.OK);
		}
		return null;
		
	}
	
	
	
	
}