package com.ana.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.ana.domain.UserVO;

public class EchoHandler extends TextWebSocketHandler {

	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();

	// 서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		String senderEmail = getEmail(session);
		System.out.println(senderEmail + "님 등장");
		userSessionsMap.put(senderEmail, session);
	}

	// 소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String msg = message.getPayload();
		if (!(StringUtils.isEmpty(msg))) {

			String[] strs = msg.split("::");
			String caller = strs[0];
			String receiver = strs[1];
			String msgContent = strs[2];

			if (userSessionsMap.get(receiver) != null) {
				System.out.println(msgContent);
				userSessionsMap.get(receiver).sendMessage(new TextMessage(caller + "|" + msgContent));
				userSessionsMap.get(caller).sendMessage(new TextMessage(caller + "|" + msgContent));
			}
		}
	}

	// 연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		userSessionsMap.remove(session.getId());
	}

	// 웹소켓 email 가져오기
	private String getEmail(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		UserVO loginUser = (UserVO) httpSession.get("user");

		if (loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getUserEmail();
		}
	}
}
